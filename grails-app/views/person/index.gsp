<%@ page import="monothil.Person" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'person.label', default: 'Person')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>

<a href="#list-person" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>

<div class="nav sub-nav" role="navigation">
    <ul>
        <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="list-person" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>

    <table>
        <thead>
        <tr>
            <g:sortableColumn property="username" title="${message(code: 'person.username.label', default: 'Username')}"/>
            <g:sortableColumn property="name" title="${message(code: 'person.name.label', default: 'Name')}"/>
            <g:sortableColumn property="email" title="${message(code: 'person.email.label', default: 'Email')}"/>
        </tr>
        </thead>
        <tbody>
        <g:each in="${personList}" status="i" var="person">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                <td><g:link action="show" id="${person.id}">${fieldValue(bean: person, field: "username")}</g:link></td>
                <td>${fieldValue(bean: person, field: "name")}</td>
                <td>${fieldValue(bean: person, field: "email")}</td>
            </tr>
        </g:each>
        </tbody>
    </table>

    <div class="pagination">
        <g:paginate total="${personCount ?: 0}"/>
    </div>
</div>
</body>
</html>
