
<%@ page import="com.harvard.cscie56.Clinic" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'clinic.label', default: 'Clinic')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-clinic" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-clinic" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list clinic">

                <g:if test="${clinicInstance?.latitude} && ${clinicInstance?.longitude}">

                <script type="text/javascript">
                    function initialize() {
                        var latitude = '${clinicInstance?.latitude}';
                        var longitude = '${clinicInstance?.longitude}';
                        var mapOptions = {
                            zoom: 16,
                            center: new google.maps.LatLng(parseFloat(latitude), parseFloat(longitude))
                        };

                        var map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
                    }

                    function loadScript() {
                        var script = document.createElement('script');
                        script.type = 'text/javascript';
                        script.src = 'https://maps.googleapis.com/maps/api/js?key=AIzaSyBX_W2K6hx_BU4CVWpdIiDcbxjmdhXN-ho&v=3.exp&' +
                                'callback=initialize';
                        document.body.appendChild(script);
                    }
                    window.onload = loadScript;

                </script>

                </g:if>

                <div id="map-canvas" style="float:right;width:300px;height:300px;">

                </div>

                <g:if test="${clinicInstance?.clinicName}">
                    <li class="fieldcontain">
                        <span id="name-label" class="property-label"><g:message code="clinic.clinicName.label" default="Name" /></span>

                        <span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${clinicInstance}" field="clinicName"/></span>

                    </li>
                </g:if>

                <g:if test="${clinicInstance?.clinicDescription}">
                    <li class="fieldcontain">
                        <span id="clinicDescription-label" class="property-label"><g:message code="clinic.clinicDescription.label" default="Clinic Description" /></span>

                        <span class="property-value" aria-labelledby="clinicDescription-label"><g:fieldValue bean="${clinicInstance}" field="clinicDescription"/></span>

                    </li>
                </g:if>
			
				<g:if test="${clinicInstance?.address}">
				<li class="fieldcontain">
					<span id="address-label" class="property-label"><g:message code="clinic.address.label" default="Address" /></span>
					
						<span class="property-value" aria-labelledby="address-label"><g:fieldValue bean="${clinicInstance}" field="address"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${clinicInstance?.city}">
				<li class="fieldcontain">
					<span id="city-label" class="property-label"><g:message code="clinic.city.label" default="City" /></span>
					
						<span class="property-value" aria-labelledby="city-label"><g:fieldValue bean="${clinicInstance}" field="city"/></span>
					
				</li>
				</g:if>

                <g:if test="${clinicInstance?.state}">
                    <li class="fieldcontain">
                        <span id="state-label" class="property-label"><g:message code="clinic.state.label" default="State" /></span>

                        <span class="property-value" aria-labelledby="state-label"><g:fieldValue bean="${clinicInstance}" field="state"/></span>

                    </li>
                </g:if>

                <g:if test="${clinicInstance?.zip}">
                    <li class="fieldcontain">
                        <span id="zip-label" class="property-label"><g:message code="clinic.zip.label" default="Zip" /></span>

                        <span class="property-value" aria-labelledby="zip-label"><g:fieldValue bean="${clinicInstance}" field="zip"/></span>

                    </li>
                </g:if>

			
				<g:if test="${clinicInstance?.latitude}">
				<li class="fieldcontain">
					<span id="latitude-label" class="property-label"><g:message code="clinic.latitude.label" default="Latitude" /></span>
					
						<span class="property-value" aria-labelledby="latitude-label">${clinicInstance.latitude}</span>
					
				</li>
				</g:if>
			
				<g:if test="${clinicInstance?.longitude}">
				<li class="fieldcontain">
					<span id="longitude-label" class="property-label"><g:message code="clinic.longitude.label" default="Longitude" /></span>
					
						<span class="property-value" aria-labelledby="longitude-label">${clinicInstance.longitude}</span>
					
				</li>
				</g:if>
			

			
				<g:if test="${clinicInstance?.phone}">
				<li class="fieldcontain">
					<span id="phone-label" class="property-label"><g:message code="clinic.phone.label" default="Phone" /></span>
					
						<span class="property-value" aria-labelledby="phone-label"><g:fieldValue bean="${clinicInstance}" field="phone"/></span>
					
				</li>
				</g:if>
			

			
			</ol>
			<g:form url="[resource:clinicInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${clinicInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
