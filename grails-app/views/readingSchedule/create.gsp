

<%@ page import="ca.openlanguage.nlpgate.ReadingSchedule" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'readingSchedule.label', default: 'ReadingSchedule')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${readingScheduleInstance}">
            <div class="errors">
                <g:renderErrors bean="${readingScheduleInstance}" as="list" />
            </div>
            </g:hasErrors>
            <!-- uploadForm simply means adds an enctype="multipart/form-data" attribute. -->
        	<g:uploadForm action="save" method="post" >
            
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="citationReference"><g:message code="readingSchedule.citationReference.label" default="Citation Reference" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: readingScheduleInstance, field: 'citationReference', 'errors')}">
                                    <g:textField name="citationReference" value="${readingScheduleInstance?.citationReference}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="courseStartDate"><g:message code="readingSchedule.courseStartDate.label" default="Course Start Date" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: readingScheduleInstance, field: 'courseStartDate', 'errors')}">
                                    <g:datePicker name="courseStartDate" precision="day" value="${readingScheduleInstance?.courseStartDate}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="dueDate"><g:message code="readingSchedule.dueDate.label" default="Due Date" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: readingScheduleInstance, field: 'dueDate', 'errors')}">
                                    <g:datePicker name="dueDate" precision="day" value="${readingScheduleInstance?.dueDate}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="sectionReference"><g:message code="readingSchedule.sectionReference.label" default="Section Reference" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: readingScheduleInstance, field: 'sectionReference', 'errors')}">
                                    <g:textField name="sectionReference" value="${readingScheduleInstance?.sectionReference}" />
                                </td>
                            </tr>
                            <!-- Row for file upload -->
                        <tr class="prop">
						    <td valign="top" class="name">
						      <label for="payload">File:</label>
						    </td>
						    <td valign="top">
						      <input type="file" id="payload" name="payload"/>
						    </td>
						  </tr>
						  
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:uploadForm>
        </div>
        
        
		  
    </body>
</html>
