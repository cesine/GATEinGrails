package ca.openlanguage.nlpgate





class ReadingScheduleController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [readingScheduleInstanceList: ReadingSchedule.list(params), readingScheduleInstanceTotal: ReadingSchedule.count()]
    }

    def create = {
        def readingScheduleInstance = new ReadingSchedule()
        readingScheduleInstance.properties = params
        return [readingScheduleInstance: readingScheduleInstance]
    }

    def save = {
        def readingScheduleInstance = new ReadingSchedule(params)
		
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
		  readingScheduleInstance.filename = uploadedFile.originalFilename
		  def outPathAndFileName = webRootDir+"payload/"+uploadedFile.originalFilename.replace(".pdf", ".txt")

		  def out = new File(outPathAndFileName)
		  if (! out.exists()){
			  //create the text file.
			  println "Text file didnt exist, using pdftotext to generate it."
			  def proc = [
				  "pdftotext",
				  "${webRootDir}/payload/${uploadedFile.originalFilename}",
				  "${outPathAndFileName}"
			  ].execute()                 // Call *execute* on the string
			  proc.waitFor()                               // Wait for the command to finish
			  // Obtain status and output
			  println "return code: ${ proc.exitValue()}, 0 is good"
			  //println "stderr: ${proc.err.text}"
			  //println "stdout: ${proc.in.text}" // *out* from the external program is *in* for groovy
			  
		  }else{
		  	println "Text file already existed."
		  }
		  
		  
		 
		  
		  /*
		   * Load the document into GATE
		   */
		  /*
		  File gateHome = new File("/Users/gina/Documents/springworkspace/NLPGate/web-app/WEB-INF/gate-files");
		  Gate.setGateHome(gateHome)
		  File userConfig = new File("/Users/gina/Documents/springworkspace/NLPGate/web-app/WEB-INF/gate-files/user-gate.xml")
		  Gate.setUserConfigFile(userConfig)
		  //Gate.init()
		  CorpusController application;
		  Corpus corpus;
		  Document doc = null;
		  /*
		  try {
			  
			  doc = (Document)gate.Factory.createResource("gate.corpora.DocumentImpl",
				  Utils.featureMap("stringContent", "here is some text", "mimeType", "txt"));
		  }catch(ResourceInstantiationException e) {
		  	//failureMessage(
		  	println("Could not create GATE document  or gate corpus for input text", e, response);
			return;
		  }
		  /*
		  try {
		  	corpus = gate.Factory.newCorpus("webapp corpus");
			  application.setCorpus(corpus);
			  corpus.add(doc);
			  println("Executing the application pipeline on the document.");
			  application.execute();
			  println("Finished Executing the application pipeline on the document.");
			  //successMessage(doc, response);
		  }catch(InterruptedException e) {
			// re-interrupt self
			Thread.currentThread().interrupt();
		  }finally {
		  	corpus.clear();
			gate.Factory.deleteResource(doc);
			gate.Factory.deleteResource(corpus);
			gate.Factory.deleteResource(application);
		  }
		  */
		  
		}
		
		
        if (readingScheduleInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'readingSchedule.label', default: 'ReadingSchedule'), readingScheduleInstance.id])}"
            redirect(action: "show", id: readingScheduleInstance.id)
        }
        else {
            render(view: "create", model: [readingScheduleInstance: readingScheduleInstance])
        }
    }

    def show = {
        def readingScheduleInstance = ReadingSchedule.get(params.id)
        if (!readingScheduleInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'readingSchedule.label', default: 'ReadingSchedule'), params.id])}"
            redirect(action: "list")
        }
        else {
            [readingScheduleInstance: readingScheduleInstance]
        }
    }

    def edit = {
        def readingScheduleInstance = ReadingSchedule.get(params.id)
        if (!readingScheduleInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'readingSchedule.label', default: 'ReadingSchedule'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [readingScheduleInstance: readingScheduleInstance]
        }
    }

    def update = {
        def readingScheduleInstance = ReadingSchedule.get(params.id)
        if (readingScheduleInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (readingScheduleInstance.version > version) {
                    
                    readingScheduleInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'readingSchedule.label', default: 'ReadingSchedule')] as Object[], "Another user has updated this ReadingSchedule while you were editing")
                    render(view: "edit", model: [readingScheduleInstance: readingScheduleInstance])
                    return
                }
            }
            readingScheduleInstance.properties = params
            if (!readingScheduleInstance.hasErrors() && readingScheduleInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'readingSchedule.label', default: 'ReadingSchedule'), readingScheduleInstance.id])}"
                redirect(action: "show", id: readingScheduleInstance.id)
            }
            else {
                render(view: "edit", model: [readingScheduleInstance: readingScheduleInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'readingSchedule.label', default: 'ReadingSchedule'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def readingScheduleInstance = ReadingSchedule.get(params.id)
        if (readingScheduleInstance) {
            try {
                readingScheduleInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'readingSchedule.label', default: 'ReadingSchedule'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'readingSchedule.label', default: 'ReadingSchedule'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'readingSchedule.label', default: 'ReadingSchedule'), params.id])}"
            redirect(action: "list")
        }
    }
}
