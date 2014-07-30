<%@ page import="monothil.Issue" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'issue.label', default: 'Issue')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<a href="#show-issue" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>

<div class="nav sub-nav" role="navigation">
    <ul>
        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]"/></g:link></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="show-issue" class="content scaffold-show" role="main">
    <h1><g:message code="default.show.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list issue">
        <g:if test="${issue?.subject}">
            <li class="fieldcontain">
                <span id="subject-label" class="property-label"><g:message code="issue.subject.label" default="Subject"/></span>
                <span class="property-value" aria-labelledby="subject-label"><g:fieldValue bean="${issue}" field="subject"/></span>
            </li>
        </g:if>
        <g:if test="${issue?.description}">
            <li class="fieldcontain">
                <span id="description-label" class="property-label"><g:message code="issue.description.label" default="Description"/></span>
                <span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${issue}" field="description"/></span>
            </li>
        </g:if>
        <g:if test="${issue?.issuerName}">
            <li class="fieldcontain">
                <span id="issuerName-label" class="property-label"><g:message code="issue.issuerName.label" default="Issuer Name"/></span>
                <span class="property-value" aria-labelledby="issuerName-label"><g:fieldValue bean="${issue}" field="issuerName"/></span>
            </li>
        </g:if>
        <g:if test="${issue?.issuerEmail}">
            <li class="fieldcontain">
                <span id="issuerEmail-label" class="property-label"><g:message code="issue.issuerEmail.label" default="Issuer Email"/></span>
                <span class="property-value" aria-labelledby="issuerEmail-label"><g:fieldValue bean="${issue}" field="issuerEmail"/></span>
            </li>
        </g:if>
        <g:if test="${issue?.assignee}">
            <li class="fieldcontain">
                <span id="assignee-label" class="property-label"><g:message code="issue.assignee.label" default="Assignee"/></span>
                <span class="property-value" aria-labelledby="assignee-label"><g:fieldValue bean="${issue}" field="assignee"/></span>
            </li>
        </g:if>
        <g:if test="${issue?.dueDate}">
            <li class="fieldcontain">
                <span id="dueDate-label" class="property-label"><g:message code="issue.dueDate.label" default="Due Date"/></span>
                <span class="property-value" aria-labelledby="dueDate-label"><g:formatDate date="${issue?.dueDate}"/></span>
            </li>
        </g:if>
        <g:if test="${issue?.dateCreated}">
            <li class="fieldcontain">
                <span id="dateCreated-label" class="property-label"><g:message code="issue.dateCreated.label" default="Date Created"/></span>
                <span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${issue?.dateCreated}"/></span>
            </li>
        </g:if>
        <g:if test="${issue?.messages}">
            <li class="fieldcontain">
                <span id="messages-label" class="property-label"><g:message code="issue.messages.label" default="Messages"/></span>
                <g:each in="${issue.messages}" var="m">
                    <span class="property-value" aria-labelledby="messages-label"><g:link controller="message" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></span>
                </g:each>
            </li>
        </g:if>
    </ol>
    <g:form url="[resource: issue, action: 'delete']" method="DELETE">
        <fieldset class="buttons">
            <g:link class="edit" action="edit" resource="${issue}"><g:message code="default.button.edit.label" default="Edit"/></g:link>
            <g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>
