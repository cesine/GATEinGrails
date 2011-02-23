

<%@ page import="ca.openlanguage.nlpgate.ReadingText" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'readingText.label', default: 'ReadingText')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${readingTextInstance}">
            <div class="errors">
                <g:renderErrors bean="${readingTextInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${readingTextInstance?.id}" />
                <g:hiddenField name="version" value="${readingTextInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="authors"><g:message code="readingText.authors.label" default="Authors" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: readingTextInstance, field: 'authors', 'errors')}">
                                    <g:textField name="authors" value="${readingTextInstance?.authors}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="biblographicEntry"><g:message code="readingText.biblographicEntry.label" default="Biblographic Entry" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: readingTextInstance, field: 'biblographicEntry', 'errors')}">
                                    <g:textField name="biblographicEntry" value="${readingTextInstance?.biblographicEntry}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="changeLog"><g:message code="readingText.changeLog.label" default="Change Log" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: readingTextInstance, field: 'changeLog', 'errors')}">
                                    <g:textField name="changeLog" value="${readingTextInstance?.changeLog}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="citations"><g:message code="readingText.citations.label" default="Citations" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: readingTextInstance, field: 'citations', 'errors')}">
                                    <g:textField name="citations" value="${readingTextInstance?.citations}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="dateAdded"><g:message code="readingText.dateAdded.label" default="Date Added" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: readingTextInstance, field: 'dateAdded', 'errors')}">
                                    <g:textField name="dateAdded" value="${readingTextInstance?.dateAdded}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="dateModified"><g:message code="readingText.dateModified.label" default="Date Modified" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: readingTextInstance, field: 'dateModified', 'errors')}">
                                    <g:textField name="dateModified" value="${readingTextInstance?.dateModified}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="dialectClassification"><g:message code="readingText.dialectClassification.label" default="Dialect Classification" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: readingTextInstance, field: 'dialectClassification', 'errors')}">
                                    <g:textField name="dialectClassification" value="${readingTextInstance?.dialectClassification}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="fileNamePDF"><g:message code="readingText.fileNamePDF.label" default="File Name PDF" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: readingTextInstance, field: 'fileNamePDF', 'errors')}">
                                    <g:textField name="fileNamePDF" value="${readingTextInstance?.fileNamePDF}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="fileNameWiki"><g:message code="readingText.fileNameWiki.label" default="File Name Wiki" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: readingTextInstance, field: 'fileNameWiki', 'errors')}">
                                    <g:textField name="fileNameWiki" value="${readingTextInstance?.fileNameWiki}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="popularityRank"><g:message code="readingText.popularityRank.label" default="Popularity Rank" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: readingTextInstance, field: 'popularityRank', 'errors')}">
                                    <g:textField name="popularityRank" value="${readingTextInstance?.popularityRank}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="source"><g:message code="readingText.source.label" default="Source" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: readingTextInstance, field: 'source', 'errors')}">
                                    <g:textField name="source" value="${readingTextInstance?.source}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="textInWiki"><g:message code="readingText.textInWiki.label" default="Text In Wiki" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: readingTextInstance, field: 'textInWiki', 'errors')}">
                                    <g:textField name="textInWiki" value="${readingTextInstance?.textInWiki}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="title"><g:message code="readingText.title.label" default="Title" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: readingTextInstance, field: 'title', 'errors')}">
                                    <g:textField name="title" value="${readingTextInstance?.title}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
