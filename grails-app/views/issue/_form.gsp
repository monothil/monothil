<%@ page import="monothil.Issue" %>
<div class="fieldcontain ${hasErrors(bean: issue, field: 'subject', 'error')} required">
    <label for="subject">
        <g:message code="issue.subject.label" default="Subject"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="subject" required="" value="${issue?.subject}" placeholder="${message(code:"issue.subject.placeholder")}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: issue, field: 'description', 'error')} required">
    <label for="description">
        <g:message code="issue.description.label" default="Description"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textArea name="description" required="" value="${issue?.description}" placeholder="${message(code:"issue.description.placeholder")}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: issue, field: 'issuerName', 'error')} required">
    <label for="issuerName">
        <g:message code="issue.issuerName.label" default="Issuer Name"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="issuerName" required="" value="${issue?.issuerName}"/>
    <span class="placeholder"><g:message code="issue.issuerName.placeholder"/></span>
</div>

<div class="fieldcontain ${hasErrors(bean: issue, field: 'issuerEmail', 'error')} required">
    <label for="issuerEmail">
        <g:message code="issue.issuerEmail.label" default="Issuer Email"/>
        <span class="required-indicator">*</span>
    </label>
    <g:field type="email" name="issuerEmail" required="" value="${issue?.issuerEmail}"/>
    <span class="placeholder"><g:message code="issue.issuerEmail.placeholder"/></span>
</div>

<div class="fieldcontain ${hasErrors(bean: issue, field: 'dueDate', 'error')} required">
    <label for="dueDate">
        <g:message code="issue.dueDate.label" default="Due Date"/>
    </label>
    <g:field type="text" name="dueDate" value="${issue?.dueDate}" placeholder="${message(code:"issue.dueDate.placeholder")}"/>
</div>
