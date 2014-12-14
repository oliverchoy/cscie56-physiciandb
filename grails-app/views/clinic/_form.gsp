<%@ page import="com.harvard.cscie56.Clinic" %>

<div class="fieldcontain ${hasErrors(bean: clinicInstance, field: 'name', 'error')} ">
    <label for="name">
        <g:message code="clinic.name.label" default="Name" />

    </label>
    <g:textField name="clinicName" value="${clinicInstance?.clinicName}" />

</div>

<div class="fieldcontain ${hasErrors(bean: clinicInstance, field: 'clinicDescription', 'error')} ">
    <label for="clinicDescription">
        <g:message code="clinic.clinicDescription.label" default="Clinic Description" />

    </label>
    <g:textArea name="clinicDescription" value="${clinicInstance?.clinicDescription}" rows="5" cols="40" />

</div>

<div class="fieldcontain ${hasErrors(bean: clinicInstance, field: 'address', 'error')} ">
	<label for="address">
		<g:message code="clinic.address.label" default="Address" />
		
	</label>
	<g:textField name="address" value="${clinicInstance?.address}" />

</div>

<div class="fieldcontain ${hasErrors(bean: clinicInstance, field: 'city', 'error')} ">
	<label for="city">
		<g:message code="clinic.city.label" default="City" />
		
	</label>
	<g:textField name="city" value="${clinicInstance?.city}" />

</div>

<div class="fieldcontain ${hasErrors(bean: clinicInstance, field: 'state', 'error')} ">
    <label for="state">
        <g:message code="clinic.state.label" default="State" />

    </label>
    <g:textField name="state" value="${clinicInstance?.state}" />

</div>

<div class="fieldcontain ${hasErrors(bean: clinicInstance, field: 'zip', 'error')} ">
    <label for="zip">
        <g:message code="clinic.zip.label" default="Zip" />

    </label>
    <g:textField name="zip" value="${clinicInstance?.zip}" />

</div>



<div class="fieldcontain ${hasErrors(bean: clinicInstance, field: 'latitude', 'error')} ">
	<label for="latitude">
		<g:message code="clinic.latitude.label" default="Latitude" />
		
	</label>
	<g:field type="text" name="latitude" value="${clinicInstance.latitude}" />

</div>

<div class="fieldcontain ${hasErrors(bean: clinicInstance, field: 'longitude', 'error')} ">
	<label for="longitude">
		<g:message code="clinic.longitude.label" default="Longitude" />
		
	</label>
	<g:field type="text" name="longitude" value="${clinicInstance.longitude}" />

</div>



<div class="fieldcontain ${hasErrors(bean: clinicInstance, field: 'phone', 'error')} ">
	<label for="phone">
		<g:message code="clinic.phone.label" default="Phone" />
		
	</label>
	<g:textField name="phone" value="${clinicInstance?.phone}" />

</div>



