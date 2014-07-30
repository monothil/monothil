<%@ page import="monothil.Issue" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'issue.label', default: 'Issue')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<a href="#list-issue" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>

<div class="nav sub-nav" role="navigation">
    <ul>
        <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="list-issue" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
        <thead>
        <tr>
            <g:sortableColumn property="subject" title="${message(code: 'issue.subject.label')}"/>
            <g:sortableColumn property="issuerName" title="${message(code: 'issue.issuerName.label')}"/>
            <g:sortableColumn property="assignee" title="${message(code: 'issue.assignee.label')}"/>
            <g:sortableColumn property="dueDate" title="${message(code: 'issue.dueDate.label')}"/>
            <g:sortableColumn property="dateCreated" title="${message(code: 'issue.dateCreated.label')}"/>
            <g:sortableColumn property="lastUpdated" title="${message(code: 'issue.lastUpdated.label')}"/>
        </tr>
        </thead>
        <tbody>
        <g:each in="${issueList}" status="i" var="issue">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                <td><g:link action="show" id="${issue.id}">${fieldValue(bean: issue, field: "subject")}</g:link></td>
                <td>${fieldValue(bean: issue, field: "issuerName")}</td>
                <td>${fieldValue(bean: issue, field: "assignee") ?: message(code: 'issue.assignee.null')}</td>
                <td>${formatDate(date: issue.dueDate) ?: message(code: 'issue.dueDate.null')}</td>
                <td><g:formatDate date="${issue.dateCreated}"/></td>
                <td><g:formatDate date="${issue.lastUpdated}"/></td>
            </tr>
        </g:each>
        </tbody>
    </table>

    <div class="pagination">
        <g:paginate total="${issueCount ?: 0}"/>
    </div>
</div>
</body>
</html>
