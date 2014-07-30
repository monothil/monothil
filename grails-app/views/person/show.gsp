<%@ page import="monothil.Person" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'person.label', default: 'Person')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<a href="#show-person" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]"/></g:link></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="show-person" class="content scaffold-show" role="main">
    <h1><g:message code="default.show.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list person">

        <g:if test="${person?.username}">
            <li class="fieldcontain">
                <span id="username-label" class="property-label"><g:message code="person.username.label" default="Username"/></span>
                <span class="property-value" aria-labelledby="username-label"><g:fieldValue bean="${person}" field="username"/></span>
            </li>
        </g:if>

        <g:if test="${person?.name}">
            <li class="fieldcontain">
                <span id="name-label" class="property-label"><g:message code="person.name.label" default="Name"/></span>
                <span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${person}" field="name"/></span>
            </li>
        </g:if>

        <g:if test="${person?.email}">
            <li class="fieldcontain">
                <span id="email-label" class="property-label"><g:message code="person.email.label" default="Email"/></span>
                <span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${person}" field="email"/></span>
            </li>
        </g:if>

        <g:if test="${person?.roles}">
            <li class="fieldcontain">
                <span id="roles-label" class="property-label"><g:message code="person.roles.label" default="Roles"/></span>

                <g:each in="${person.roles}" var="r">
                    <span class="property-value" aria-labelledby="roles-label">
                        <g:link controller="role" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link>
                    </span>
                </g:each>
            </li>
        </g:if>

    </ol>
    <g:form url="[resource: person, action: 'delete']" method="DELETE">
        <fieldset class="buttons">
            <g:link class="edit" action="edit" resource="${person}"><g:message code="default.button.edit.label" default="Edit"/></g:link>
            <g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>
