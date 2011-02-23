
<%@ page import="ca.openlanguage.nlpgate.ReadingText" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'readingText.label', default: 'ReadingText')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="readingText.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: readingTextInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="readingText.authors.label" default="Authors" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: readingTextInstance, field: "authors")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="readingText.biblographicEntry.label" default="Biblographic Entry" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: readingTextInstance, field: "biblographicEntry")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="readingText.changeLog.label" default="Change Log" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: readingTextInstance, field: "changeLog")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="readingText.citations.label" default="Citations" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: readingTextInstance, field: "citations")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="readingText.dateAdded.label" default="Date Added" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: readingTextInstance, field: "dateAdded")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="readingText.dateModified.label" default="Date Modified" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: readingTextInstance, field: "dateModified")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="readingText.dialectClassification.label" default="Dialect Classification" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: readingTextInstance, field: "dialectClassification")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="readingText.fileNamePDF.label" default="File Name PDF" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: readingTextInstance, field: "fileNamePDF")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="readingText.fileNameWiki.label" default="File Name Wiki" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: readingTextInstance, field: "fileNameWiki")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="readingText.popularityRank.label" default="Popularity Rank" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: readingTextInstance, field: "popularityRank")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="readingText.source.label" default="Source" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: readingTextInstance, field: "source")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="readingText.textInWiki.label" default="Text In Wiki" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: readingTextInstance, field: "textInWiki")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="readingText.title.label" default="Title" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: readingTextInstance, field: "title")}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${readingTextInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
