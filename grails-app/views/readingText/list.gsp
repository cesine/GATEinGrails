
<%@ page import="ca.openlanguage.nlpgate.ReadingText" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'readingText.label', default: 'ReadingText')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'readingText.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="authors" title="${message(code: 'readingText.authors.label', default: 'Authors')}" />
                        
                            <g:sortableColumn property="biblographicEntry" title="${message(code: 'readingText.biblographicEntry.label', default: 'Biblographic Entry')}" />
                        
                            <g:sortableColumn property="changeLog" title="${message(code: 'readingText.changeLog.label', default: 'Change Log')}" />
                        
                            <g:sortableColumn property="citations" title="${message(code: 'readingText.citations.label', default: 'Citations')}" />
                        
                            <g:sortableColumn property="dateAdded" title="${message(code: 'readingText.dateAdded.label', default: 'Date Added')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${readingTextInstanceList}" status="i" var="readingTextInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${readingTextInstance.id}">${fieldValue(bean: readingTextInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: readingTextInstance, field: "authors")}</td>
                        
                            <td>${fieldValue(bean: readingTextInstance, field: "biblographicEntry")}</td>
                        
                            <td>${fieldValue(bean: readingTextInstance, field: "changeLog")}</td>
                        
                            <td>${fieldValue(bean: readingTextInstance, field: "citations")}</td>
                        
                            <td>${fieldValue(bean: readingTextInstance, field: "dateAdded")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${readingTextInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
