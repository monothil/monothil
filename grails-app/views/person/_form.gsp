<%@ page import="monothil.Person" %>

<div class="fieldcontain ${hasErrors(bean: person, field: 'username', 'error')} required">
    <label for="username">
        <g:message code="person.username.label" default="Username"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="username" required="" value="${person?.username}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: person, field: 'password', 'error')} required">
    <label for="password">
        <g:message code="person.password.label" default="Password"/>
        <span class="required-indicator">*</span>
    </label>
    <g:passwordField name="password" required="" value="${person?.password}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: person, field: 'name', 'error')} required">
    <label for="name">
        <g:message code="person.name.label" default="Name"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="name" required="" value="${person?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: person, field: 'email', 'error')} required">
    <label for="email">
        <g:message code="person.email.label" default="Email"/>
        <span class="required-indicator">*</span>
    </label>
    <g:field type="email" name="email" required="" value="${person?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: person, field: 'roles', 'error')} ">
    <label for="roles">
        <g:message code="person.roles.label" default="Roles"/>

    </label>
    <g:select name="roles" from="${monothil.Role.list()}" multiple="multiple" optionKey="id" size="5" value="${person?.roles*.id}" class="many-to-many"/>
</div>

