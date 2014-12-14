
<%@ page import="com.harvard.cscie56.Publication" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'publication.label', default: 'Publication')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-publication" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-publication" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list publication">


                <g:if test="${publicationInstance?.title}">
                    <li class="fieldcontain">
                        <span id="title-label" class="property-label"><g:message code="publication.title.label" default="Title" /></span>

                        <span class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${publicationInstance}" field="title"/></span>

                    </li>
                </g:if>
			
				<g:if test="${publicationInstance?.physician}">
				<li class="fieldcontain">
					<span id="physician-label" class="property-label"><g:message code="publication.physician.label" default="Physician" /></span>
					
						<span class="property-value" aria-labelledby="physician-label"><g:link controller="physician" action="show" id="${publicationInstance?.physician?.id}">${publicationInstance?.physician?.fullName}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${publicationInstance?.publicationAbstract}">
				<li class="fieldcontain">
					<span id="publicationAbstract-label" class="property-label"><g:message code="publication.publicationAbstract.label" default="Publication Abstract" /></span>
					
						<span class="property-value" aria-labelledby="publicationAbstract-label"><g:fieldValue bean="${publicationInstance}" field="publicationAbstract"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${publicationInstance?.publicationDate}">
				<li class="fieldcontain">
					<span id="publicationDate-label" class="property-label"><g:message code="publication.publicationDate.label" default="Publication Date" /></span>
					
						<span class="property-value" aria-labelledby="publicationDate-label"><g:formatDate date="${publicationInstance?.publicationDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${publicationInstance?.publicationUrl}">
				<li class="fieldcontain">
					<span id="publicationUrl-label" class="property-label"><g:message code="publication.publicationUrl.label" default="Publication Url" /></span>
					
						<span class="property-value" aria-labelledby="publicationUrl-label"><a href="${publicationInstance?.publicationUrl}"><g:fieldValue bean="${publicationInstance}" field="publicationUrl"/></a></span>
					
				</li>
				</g:if>

			
			</ol>
			<g:form url="[resource:publicationInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${publicationInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
