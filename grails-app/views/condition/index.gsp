
<%@ page import="com.harvard.cscie56.Condition" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'condition.label', default: 'Condition')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-condition" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-condition" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>

						<g:sortableColumn property="conditionName" title="${message(code: 'condition.conditionName.label', default: 'Condition Name')}" />

                        <g:sortableColumn property="causes" title="${message(code: 'condition.causes.label', default: 'Causes')}" />
					
						<g:sortableColumn property="symptoms" title="${message(code: 'condition.symptoms.label', default: 'Symptoms')}" />
					
						<g:sortableColumn property="treatments" title="${message(code: 'condition.treatments.label', default: 'Treatments')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${conditionInstanceList}" status="i" var="conditionInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                        <td><g:link action="show" id="${conditionInstance.id}">${fieldValue(bean: conditionInstance, field: "conditionName")}</g:link></td>

						<td>${fieldValue(bean: conditionInstance, field: "causes")}</td>
					
						<td>${fieldValue(bean: conditionInstance, field: "symptoms")}</td>
					
						<td>${fieldValue(bean: conditionInstance, field: "treatments")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${conditionInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
