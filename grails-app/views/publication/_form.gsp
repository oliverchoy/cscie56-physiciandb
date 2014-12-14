<%@ page import="com.harvard.cscie56.Publication" %>


<div class="fieldcontain ${hasErrors(bean: publicationInstance, field: 'title', 'error')} ">
    <label for="title">
        <g:message code="publication.title.label" default="Title" />

    </label>
    <g:textField name="title" value="${publicationInstance?.title}" />

</div>

<div class="fieldcontain ${hasErrors(bean: publicationInstance, field: 'physician', 'error')} ">
	<label for="physician">
		<g:message code="publication.physician.label" default="Physician" />
		
	</label>
	<g:select id="physician" name="physician.id" from="${com.harvard.cscie56.Physician.list()}" optionKey="id" optionValue="fullName" required="" value="${publicationInstance?.physician?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: publicationInstance, field: 'publicationAbstract', 'error')} ">
	<label for="publicationAbstract">
		<g:message code="publication.publicationAbstract.label" default="Publication Abstract" />
		
	</label>
	<g:textArea name="publicationAbstract" value="${publicationInstance?.publicationAbstract}" rows="10" cols="80" />

</div>

<div class="fieldcontain ${hasErrors(bean: publicationInstance, field: 'publicationDate', 'error')} ">
	<label for="publicationDate">
		<g:message code="publication.publicationDate.label" default="Publication Date" />
		
	</label>
	<g:datePicker name="publicationDate" precision="day" value="${publicationInstance?.publicationDate}" />

</div>

<div class="fieldcontain ${hasErrors(bean: publicationInstance, field: 'publicationUrl', 'error')} ">
	<label for="publicationUrl">
		<g:message code="publication.publicationUrl.label" default="Publication Url" />
		
	</label>
	<g:textField name="publicationUrl" value="${publicationInstance?.publicationUrl}" />

</div>
