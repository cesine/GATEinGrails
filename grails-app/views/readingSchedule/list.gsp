
<%@ page import="ca.openlanguage.nlpgate.ReadingSchedule" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'readingSchedule.label', default: 'ReadingSchedule')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'readingSchedule.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="citationReference" title="${message(code: 'readingSchedule.citationReference.label', default: 'Citation Reference')}" />
                        
                            <g:sortableColumn property="courseStartDate" title="${message(code: 'readingSchedule.courseStartDate.label', default: 'Course Start Date')}" />
                        
                            <g:sortableColumn property="dueDate" title="${message(code: 'readingSchedule.dueDate.label', default: 'Due Date')}" />
                        
                            <g:sortableColumn property="sectionReference" title="${message(code: 'readingSchedule.sectionReference.label', default: 'Section Reference')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${readingScheduleInstanceList}" status="i" var="readingScheduleInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${readingScheduleInstance.id}">${fieldValue(bean: readingScheduleInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: readingScheduleInstance, field: "citationReference")}</td>
                        
                            <td><g:formatDate date="${readingScheduleInstance.courseStartDate}" /></td>
                        
                            <td><g:formatDate date="${readingScheduleInstance.dueDate}" /></td>
                        
                            <td>${fieldValue(bean: readingScheduleInstance, field: "sectionReference")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${readingScheduleInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
