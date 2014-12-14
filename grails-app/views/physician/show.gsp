
<%@ page import="com.harvard.cscie56.Physician" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'physician.label', default: 'Physician')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-physician" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-physician" class="content scaffold-show" role="main">
			<h1>Physician Profile</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list physician">

                <g:if test="${physicianInstance?.firstName}">
                    <li class="fieldcontain">
                        <span id="firstName-label" class="property-label"><g:message code="physician.firstName.label" default="First Name" /></span>

                        <span class="property-value" aria-labelledby="firstName-label"><g:fieldValue bean="${physicianInstance}" field="firstName"/></span>

                    </li>
                </g:if>

                <g:if test="${physicianInstance?.lastName}">
                    <li class="fieldcontain">
                        <span id="lastName-label" class="property-label"><g:message code="physician.lastName.label" default="Last Name" /></span>

                        <span class="property-value" aria-labelledby="lastName-label"><g:fieldValue bean="${physicianInstance}" field="lastName"/></span>

                    </li>
                </g:if>

                <g:if test="${physicianInstance?.npi}">
                    <li class="fieldcontain">
                        <span id="npi-label" class="property-label"><g:message code="physician.npi.label" default="NPI" /></span>

                        <span class="property-value" aria-labelledby="npi-label">${physicianInstance.npi}</span>

                    </li>
                </g:if>

                <g:if test="${physicianInstance?.picturePath}">
                    <li class="fieldcontain">
                        <span id="picturePath-label" class="property-label"><g:message code="physician.picturePath.label" default="Profile Picture" /></span>

                        <span class="property-value" aria-labelledby="picturePath-label">
                            <img src="<g:fieldValue bean="${physicianInstance}" field="picturePath"/>" width="200"/>
                        </span>

                    </li>
                </g:if>
			
				<g:if test="${physicianInstance?.clinics}">
				<li class="fieldcontain">
					<span id="clinics-label" class="property-label"><g:message code="physician.clinics.label" default="Clinics" /></span>
					
						<g:each in="${physicianInstance.clinics}" var="c">
						<span class="property-value" aria-labelledby="clinics-label"><g:link controller="clinic" action="show" id="${c.id}">${c?.clinicName}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${physicianInstance?.conditionsTreated}">
				<li class="fieldcontain">
					<span id="conditionsTreated-label" class="property-label"><g:message code="physician.conditionsTreated.label" default="Conditions Treated" /></span>
					
						<g:each in="${physicianInstance.conditionsTreated}" var="c">
						<span class="property-value" aria-labelledby="conditionsTreated-label"><g:link controller="condition" action="show" id="${c.id}">${c?.conditionName}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			

			

			
				<g:if test="${physicianInstance?.publications}">
				<li class="fieldcontain">
					<span id="publications-label" class="property-label"><g:message code="physician.publications.label" default="Publications" /></span>
					
						<g:each in="${physicianInstance.publications}" var="p">
						<span class="property-value" aria-labelledby="publications-label"><g:link controller="publication" action="show" id="${p.id}">${p?.title}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:physicianInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${physicianInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
