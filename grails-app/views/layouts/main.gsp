<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title><g:layoutTitle default="Grails"/></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="${assetPath(src: 'favicon.ico')}" type="image/x-icon">
    <link rel="apple-touch-icon" href="${assetPath(src: 'apple-touch-icon.png')}">
    <link rel="apple-touch-icon" sizes="114x114" href="${assetPath(src: 'apple-touch-icon-retina.png')}">
    <asset:stylesheet src="application.css"/>
    <asset:javascript src="application.js"/>
    <asset:javascript src="jquery.js"/>
    <g:layoutHead/>
</head>

<body>
<div id="grailsLogo" role="banner"><g:link controller="home"><asset:image src="grails_logo.png" alt="Grails"/></g:link></div>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <sec:ifNotLoggedIn>
            <li><g:link controller="login"><g:message code="nav.login.label"/></g:link></li>
        </sec:ifNotLoggedIn>
        <sec:ifLoggedIn>
            <li>
                <a href="#" onclick="$('#logout-form').submit();
                return false;"><g:message code="nav.logout.label"/></a>
                <span class="hidden"><g:form name="logout-form" controller="logout" method="post"><g:submitButton class="logout" name="${message(code: "nav.logout.label")}"/></g:form></span>
            </li>
        </sec:ifLoggedIn>
    </ul>

</div>
<g:layoutBody/>
<div class="footer" role="contentinfo"></div>

<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
</body>
</html>
