<%@ page import="com.harvard.cscie56.Physician" %>

<div class="fieldcontain ${hasErrors(bean: physicianInstance, field: 'firstName', 'error')} ">
    <label for="firstName">
        <g:message code="physician.firstName.label" default="First Name" />
    </label>
    <g:textField name="firstName" value="${physicianInstance?.firstName}" />

</div>

<div class="fieldcontain ${hasErrors(bean: physicianInstance, field: 'lastName', 'error')} ">
    <label for="lastName">
        <g:message code="physician.lastName.label" default="Last Name" />
    </label>
    <g:textField name="lastName" value="${physicianInstance?.lastName}" />
</div>

<div class="fieldcontain ${hasErrors(bean: physicianInstance, field: 'npi', 'error')} ">
    <label for="npi">
        <g:message code="physician.npi.label" default="NPI" />
    </label>
    <g:field type="number" name="npi" value="${physicianInstance.npi}" />
</div>


<div class="fieldcontain ${hasErrors(bean: physicianInstance, field: 'picturePath', 'error')} ">
    <label for="picturePath">
        <g:message code="physician.picturePath.label" default="Picture" />
    </label>
    <div style="float:right;">
    <g:if test="${physicianInstance?.picturePath}">
        <img src="${physicianInstance?.picturePath}" width="100"/><br/>
        Upload a new file to replace current picture.<br/>
    </g:if>
    </div>
    <input type="file" name="physicianPicture" />

</div>

<div class="fieldcontain ${hasErrors(bean: physicianInstance, field: 'clinics', 'error')} ">
	<label for="clinics">
		<g:message code="physician.clinics.label" default="Clinics" />
	</label>
	<g:select name="clinics" from="${com.harvard.cscie56.Clinic.list()}" multiple="multiple" optionKey="id" optionValue="clinicName" size="5" required="" value="${physicianInstance?.clinics*.id}" class="many-to-many" />
</div>

<div class="fieldcontain ${hasErrors(bean: physicianInstance, field: 'conditionsTreated', 'error')} ">
	<label for="conditionsTreated">
		<g:message code="physician.conditionsTreated.label" default="Conditions Treated" />
		
	</label>
	<g:select name="conditionsTreated" from="${com.harvard.cscie56.Condition.list()}" multiple="multiple" optionKey="id" optionValue="conditionName" size="5" required="" value="${physicianInstance?.conditionsTreated*.id}" class="many-to-many" />

</div>




<div class="fieldcontain ${hasErrors(bean: physicianInstance, field: 'publications', 'error')} ">
	<label for="publications">
		<g:message code="physician.publications.label" default="Publications" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${physicianInstance?.publications?}" var="p">
    <li><g:link controller="publication" action="show" id="${p.id}">${p?.title}</g:link></li>
</g:each>
<li class="add">
<g:link controller="publication" action="create" params="['physician.id': physicianInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'publication.label', default: 'Publication')])}</g:link>
</li>
</ul>


</div>

