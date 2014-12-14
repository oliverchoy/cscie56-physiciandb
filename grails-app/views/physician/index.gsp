
<%@ page import="com.harvard.cscie56.Physician" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'physician.label', default: 'Physician')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-physician" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-physician" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
						<!--<g:sortableColumn property="firstName" title="${message(code: 'physician.firstName.label', default: 'First Name')}" />-->
					
						<g:sortableColumn property="lastName" title="${message(code: 'physician.lastName.label', default: 'Physician Name')}" />
					
						<g:sortableColumn property="npi" title="${message(code: 'physician.npi.label', default: 'NPI')}" />
					
						<g:sortableColumn property="picturePath" title="${message(code: 'physician.picturePath.label', default: 'Profile Image')}" />
					</tr>
				</thead>
				<tbody>
				<g:each in="${physicianInstanceList}" status="i" var="physicianInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td>
                            <g:link action="show" id="${physicianInstance.id}">${fieldValue(bean: physicianInstance, field: "fullName")}</g:link>

                        </td>
					
						<td>${physicianInstance.npi}</td>
					
						<td><img src="${fieldValue(bean: physicianInstance, field: "picturePath")}" width="200"/></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${physicianInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
