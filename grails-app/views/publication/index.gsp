
<%@ page import="com.harvard.cscie56.Publication" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'publication.label', default: 'Publication')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-publication" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-publication" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>

                        <g:sortableColumn property="title" title="${message(code: 'publication.title.label', default: 'Title')}" />
						<th><g:message code="publication.physician.label" default="Physician" /></th>


						<g:sortableColumn property="publicationDate" title="${message(code: 'publication.publicationDate.label', default: 'Publication Date')}" />
					
						<g:sortableColumn property="publicationUrl" title="${message(code: 'publication.publicationUrl.label', default: 'Publication Url')}" />
					

					
					</tr>
				</thead>
				<tbody>
				<g:each in="${publicationInstanceList}" status="i" var="publicationInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                        <td><g:link action="show" id="${publicationInstance.id}">${fieldValue(bean: publicationInstance, field: "title")}</g:link></td>
					
						<td>${fieldValue(bean: publicationInstance, field: "physician.fullName")}</td>

					
						<td><g:formatDate format="yyyy/MM/dd" date="${publicationInstance.publicationDate}" /></td>
					
						<td>${fieldValue(bean: publicationInstance, field: "publicationUrl")}</td>
					

					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${publicationInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
