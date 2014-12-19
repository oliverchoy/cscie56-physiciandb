
<%@ page import="com.harvard.cscie56.Physician" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'physician.label', default: 'Physician')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
        <div class="container">
            <div class="nav">
                <ul>
                    <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                    <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                </ul>
            </div>
            <div class="row" role="main">
                <h2><g:message code="default.list.label" args="[entityName]" /></h2>
                <g:if test="${flash.message}">
                    <div class="message" role="status">${flash.message}</div>
                </g:if>
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <g:sortableColumn property="lastName" title="${message(code: 'physician.lastName.label', default: 'Physician Name')}" />
                            <g:sortableColumn property="npi" title="${message(code: 'physician.npi.label', default: 'NPI')}" />
                            <g:sortableColumn property="picturePath" title="${message(code: 'physician.picturePath.label', default: 'Profile Image')}" />
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${physicianInstanceList}" status="i" var="physicianInstance">
                        <tr class="${(i % 2) == 0 ? 'warning' : ''}">
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
        </div>
	</body>
</html>
