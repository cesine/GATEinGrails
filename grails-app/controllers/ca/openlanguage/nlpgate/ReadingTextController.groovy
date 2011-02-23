package ca.openlanguage.nlpgate

import java.io.FileReader;
import grails.converters.*;
import grails.util.*;

class ReadingTextController {
	

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	def xmlList = {
		render ReadingText.list as XML
	}
	def xmlShow = {
		render ReadingText.get(params.id) as XML
	}
	def customXmlList = {
		def list = Airport.list()
		render(contentTypes:"text/xml"){
			readingtexts{
				for (a in list){
					readingText(id:a.id){
						content(a.textInWiki)
					}
				}
			}
		}
	}
	def debugAccept = {
		def clientRequest = request.getHeader("accept")
		def serverResponse = request.format
		render "Client: ${clientRequest}\nServer: ${serverResponse}\n"
	}
	
    def index = {
		switch(request.method){
			case "POST":
				//render "Create\n"
				def readingText = new ReadingText(params.readingText)
//				if(readingText.save()){
//					response.status = 201 // Created
//					render readingText as XML
//				}
//				else{
//					response.status = 500 //Internal server Error
//					render "Could not create new Reading Text due to errors:\n ${readingText.errors}"
//				}
				break
			case "GET":
				//render "Retrieve\n"
				if(params.title){
					def readingText = ReadingText.findById(params.title)
					if(readingText){
						render(readingText as XML)
					}
					else{
						response.status = 404//Not Found
						render "${params.title} not found."
					}
				}
				else{render ReadingText.list() as XML}
				break
			case "PUT":
				render "Update\n"
				break
			case "DELETE":
				//render "Delete\n"
				if(params.title){
					def readingText = ReadingText.findById(params.title)
					if(readingText){
						readingText.delete()
						render "Successfully Deleted." //TODO instaed gives not allowed
					}
					else{
						response.status = 404//Not Found
						render "${params.title} not found."
					}
				}
				else{
					response.status = 400 //Bad Request
					render """DELETE request must include the title
								Example /rest/readingText/title
					"""
				}
				break
		}
		//redirect(action: "list", params: params)
    }

    def list = {
        if (!params.max) params.max = 10
		//this control over max number of params to show was changed, check history to put it back 
		def list = ReadingText.list(params)
		withFormat{
			html{
				return [readingTextInstanceList: ReadingText.list(params), readingTextInstanceTotal: ReadingText.count()]
			}
			xml{
				render list as XML
			}
		}
    }

    def create = {
        def readingTextInstance = new ReadingText()
        readingTextInstance.properties = params
        return [readingTextInstance: readingTextInstance]
    }

    def save = {
        def readingTextInstance = new ReadingText(params)

		//handle uploaded file, print some details to the console
		def uploadedFile = request.getFile('payload')
		if(!uploadedFile.empty){
			println "Class: ${uploadedFile.class}"
			println "Name: ${uploadedFile.name}"
			println "OriginalFileName: ${uploadedFile.originalFilename}"
			println "Size: ${uploadedFile.size}"
			println "ContentType: ${uploadedFile.contentType}"
			//save the file
			def webRootDir = servletContext.getRealPath("/")
			//do i need to get rid of the /${session.user.login} or can i keep it. forcing authentication to use the API
			def userDir = new File(webRootDir, "/payload")
			userDir.mkdirs()
			uploadedFile.transferTo( new File( userDir, uploadedFile.originalFilename))
			readingTextInstance.fileNamePDF = uploadedFile.originalFilename
			readingTextInstance.fileNameWiki = webRootDir+"payload/"+uploadedFile.originalFilename.replace(".pdf", ".txt")

			def sourceTxt = new File(readingTextInstance.fileNameWiki)
			def out = new StringBuffer()
			out.append("=section=")
			if (! sourceTxt.exists()){
				//create the text file.
				println "Text file didnt exist, using pdftotext to generate it."
				def proc = [
					"pdftotext",
					"${webRootDir}/payload/${uploadedFile.originalFilename}",
					"${readingTextInstance.fileNameWiki}"
				].execute()                 // Call *execute* on the string
				proc.waitFor()                               // Wait for the command to finish

				/*
				 * If the text file was created, set the sourceTxt to it so that it can be read below
				 */
				// Obtain status and output
				println "return code: ${ proc.exitValue()}, 0 is good"
				if(0==${ proc.exitValue()})
				{
					println "Text file created was successfull"
					sourceTxt = new File(readingTextInstance.fileNameWiki)
				}else{
				//TODO do somethign appropriate here
					sourceTxt = new File(readingTextInstance.fileNameWiki)
					sourceTxt.println("No text found.")
				}
				//println "stderr: ${proc.err.text}"
				//println "stdout: ${proc.in.text}" // *out* from the external program is *in* for groovy
				if (false){
					proc = [
						"git",
						"init"
					].execute()                 // Call *execute* on the string
					proc.waitFor()
					// Obtain status and output
					println "return code: ${ proc.exitValue()}, 0 is good"
					println "stderr: ${proc.err.text}"
					println "stdout: ${proc.in.text}" // *out* from the external program is *in* for groovy


					proc = [
						"git",
						"config",
						"--global",
						"user.name",
						"nlpgate"
					].execute()                 // Call *execute* on the string
					proc.waitFor()
					// Obtain status and output
					println "return code: ${ proc.exitValue()}, 0 is good"
					println "stderr: ${proc.err.text}"
					println "stdout: ${proc.in.text}" // *out* from the external program is *in* for groovy

					proc = [
						"git",
						"config",
						"--global",
						"user.email",
						"none@nlpgate"
					].execute()                 // Call *execute* on the string
					proc.waitFor()
					// Obtain status and output
					println "return code: ${ proc.exitValue()}, 0 is good"
					println "stderr: ${proc.err.text}"
					println "stdout: ${proc.in.text}" // *out* from the external program is *in* for groovy
				}//end git setup

				/*
				 * Add the text to version control
				 */
				proc = [
					"git",
					"add",
					"${readingTextInstance.fileNameWiki}"
				].execute()                 // Call *execute* on the string
				proc.waitFor()
				// Obtain status and output
				println "return code: ${ proc.exitValue()}, 0 is good"
				println "stderr: ${proc.err.text}"
				println "stdout: ${proc.in.text}" // *out* from the external program is *in* for groovy

				proc = [
					"git",
					"commit",
					"-m",
					"extracted txt from pdf ${readingTextInstance.fileNamePDF}"
				].execute()                 // Call *execute* on the string
				proc.waitFor()
				// Obtain status and output
				println "return code: ${ proc.exitValue()}, 0 is good"
				println "stderr: ${proc.err.text}"
				println "stdout: ${proc.in.text}" // *out* from the external program is *in* for groovy



			}else{
				println "Text file already existed."
			}
			/*
			 * Open the text, find sections and tag them
			 */		
			
			try{
				try{
					sourceTxt.eachLine{
						if (it =~ /Section/){
							println "Found a section: ${it}"
							out.append("=/section=\n\n\n=section=")
						}
						it.replaceAll("^L","=pagebreak=")
						out.append it.decodeHTML()
						out.append("\n")
					}
				}finally{
//					out.append("=/section=")
//					sourceTxt.close()
//					readingTextInstance.textInWiki=out.toString()
//					def outTxt = new File(readingTextInstance.fileNameWiki)
//					outTxt.println(out.toString())
//					outTxt.close()
					println ("In the finally clause")
					
				}
			}catch(e) { 
				println("There was an exception ${e}")
			}
			out.append("=/section=")
			//sourceTxt.close()
			readingTextInstance.textInWiki=out.toString().encodeAsHTML()
			
			sourceTxt.delete()
			def outTxt = new File(readingTextInstance.fileNameWiki)
			outTxt.append(out.toString().encodeAsHTML())
			//outTxt.close()

			/*
			* Add the changed text to version control
			*/
		   def proc = [
			   "git",
			   "add",
			   "${readingTextInstance.fileNameWiki}"
		   ].execute()                 // Call *execute* on the string
		   proc.waitFor()
		   // Obtain status and output
		   println "return code: ${ proc.exitValue()}, 0 is good"
		   println "stderr: ${proc.err.text}"
		   println "stdout: ${proc.in.text}" // *out* from the external program is *in* for groovy

		   proc = [
			   "git",
			   "commit",
			   "-m",
			   "tagged sections in text for ${readingTextInstance.fileNamePDF}"
		   ].execute()                 // Call *execute* on the string
		   proc.waitFor()
		   // Obtain status and output
		   println "return code: ${ proc.exitValue()}, 0 is good"
		   println "stderr: ${proc.err.text}"
		   println "stdout: ${proc.in.text}" // *out* from the external program is *in* for groovy
			
		}//end processing the file



		if (readingTextInstance.save(flush: true)) {
			flash.message = "${message(code: 'default.created.message', args: [message(code: 'readingText.label', default: 'ReadingText'), readingTextInstance.id])}"
			redirect(action: "show", id: readingTextInstance.id)
		}
		else {
			render(view: "create", model: [readingTextInstance: readingTextInstance])
		}
	}

    def show = {
        def readingTextInstance = ReadingText.get(params.id)
        if (!readingTextInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'readingText.label', default: 'ReadingText'), params.id])}"
            redirect(action: "list")
        }
        else {
            [readingTextInstance: readingTextInstance]
        }
    }

    def edit = {
        def readingTextInstance = ReadingText.get(params.id)
        if (!readingTextInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'readingText.label', default: 'ReadingText'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [readingTextInstance: readingTextInstance]
        }
    }

    def update = {
        def readingTextInstance = ReadingText.get(params.id)
        if (readingTextInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (readingTextInstance.version > version) {
                    
                    readingTextInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'readingText.label', default: 'ReadingText')] as Object[], "Another user has updated this ReadingText while you were editing")
                    render(view: "edit", model: [readingTextInstance: readingTextInstance])
                    return
                }
            }
            readingTextInstance.properties = params
            if (!readingTextInstance.hasErrors() && readingTextInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'readingText.label', default: 'ReadingText'), readingTextInstance.id])}"
                redirect(action: "show", id: readingTextInstance.id)
            }
            else {
                render(view: "edit", model: [readingTextInstance: readingTextInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'readingText.label', default: 'ReadingText'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def readingTextInstance = ReadingText.get(params.id)
        if (readingTextInstance) {
            try {
                readingTextInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'readingText.label', default: 'ReadingText'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'readingText.label', default: 'ReadingText'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'readingText.label', default: 'ReadingText'), params.id])}"
            redirect(action: "list")
        }
    }
}
