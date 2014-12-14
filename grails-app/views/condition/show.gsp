
<%@ page import="com.harvard.cscie56.Condition" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'condition.label', default: 'Condition')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-condition" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-condition" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list condition">
			
				<g:if test="${conditionInstance?.causes}">
				<li class="fieldcontain">
					<span id="causes-label" class="property-label"><g:message code="condition.causes.label" default="Causes" /></span>
					
						<span class="property-value" aria-labelledby="causes-label"><g:fieldValue bean="${conditionInstance}" field="causes"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${conditionInstance?.conditionName}">
				<li class="fieldcontain">
					<span id="conditionName-label" class="property-label"><g:message code="condition.conditionName.label" default="Condition Name" /></span>
					
						<span class="property-value" aria-labelledby="conditionName-label"><g:fieldValue bean="${conditionInstance}" field="conditionName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${conditionInstance?.symptoms}">
				<li class="fieldcontain">
					<span id="symptoms-label" class="property-label"><g:message code="condition.symptoms.label" default="Symptoms" /></span>
					
						<span class="property-value" aria-labelledby="symptoms-label"><g:fieldValue bean="${conditionInstance}" field="symptoms"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${conditionInstance?.treatments}">
				<li class="fieldcontain">
					<span id="treatments-label" class="property-label"><g:message code="condition.treatments.label" default="Treatments" /></span>
					
						<span class="property-value" aria-labelledby="treatments-label"><g:fieldValue bean="${conditionInstance}" field="treatments"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:conditionInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${conditionInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
