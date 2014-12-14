
<%@ page import="com.harvard.cscie56.Clinic" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'clinic.label', default: 'Clinic')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-clinic" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-clinic" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
                        <g:sortableColumn property="clinicName" title="${message(code: 'clinic.clinicName.label', default: 'Name')}" />
					
						<g:sortableColumn property="city" title="Clinic Address" />

                        <g:sortableColumn property="city" title="Coordinate" />

					</tr>
				</thead>
				<tbody>
				<g:each in="${clinicInstanceList}" status="i" var="clinicInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                        <td><g:link action="show" id="${clinicInstance.id}">${fieldValue(bean: clinicInstance, field: "clinicName")}</g:link></td>

						<td>
                            ${fieldValue(bean: clinicInstance, field: "address")},
                            ${fieldValue(bean: clinicInstance, field: "city")},
                            ${fieldValue(bean: clinicInstance, field: "state")} ${fieldValue(bean: clinicInstance, field: "zip")}
                        </td>

						<td>${clinicInstance.latitude} ${clinicInstance.longitude}
                            </td>


					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${clinicInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
