<%@ page import="com.harvard.cscie56.Condition" %>

<div class="fieldcontain ${hasErrors(bean: conditionInstance, field: 'conditionName', 'error')} ">
    <label for="conditionName">
        <g:message code="condition.conditionName.label" default="Condition Name" />

    </label>
    <g:textField name="conditionName" value="${conditionInstance?.conditionName}" />

</div>

<div class="fieldcontain ${hasErrors(bean: conditionInstance, field: 'causes', 'error')} ">
	<label for="causes">
		<g:message code="condition.causes.label" default="Causes" />
		
	</label>
	<g:textField name="causes" value="${conditionInstance?.causes}" />

</div>


<div class="fieldcontain ${hasErrors(bean: conditionInstance, field: 'symptoms', 'error')} ">
	<label for="symptoms">
		<g:message code="condition.symptoms.label" default="Symptoms" />
		
	</label>
	<g:textField name="symptoms" value="${conditionInstance?.symptoms}" />

</div>

<div class="fieldcontain ${hasErrors(bean: conditionInstance, field: 'treatments', 'error')} ">
	<label for="treatments">
		<g:message code="condition.treatments.label" default="Treatments" />
		
	</label>
	<g:textField name="treatments" value="${conditionInstance?.treatments}" />

</div>

