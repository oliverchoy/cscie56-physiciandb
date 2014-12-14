<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Welcome to CSCI E-56 Physicians Database</title>
		<style type="text/css" media="screen">
			#status {
				background-color: #eee;
				border: .2em solid #fff;
				margin: 2em 2em 1em;
				padding: 1em;
				width: 12em;
				float: left;
				-moz-box-shadow: 0px 0px 1.25em #ccc;
				-webkit-box-shadow: 0px 0px 1.25em #ccc;
				box-shadow: 0px 0px 1.25em #ccc;
				-moz-border-radius: 0.6em;
				-webkit-border-radius: 0.6em;
				border-radius: 0.6em;
			}

			.ie6 #status {
				display: inline; /* float double margin fix http://www.positioniseverything.net/explorer/doubled-margin.html */
			}

			#status ul {
				font-size: 0.9em;
				list-style-type: none;
				margin-bottom: 0.6em;
				padding: 0;
			}

			#status li {
				line-height: 1.3;
			}

			#status h1 {
				text-transform: uppercase;
				font-size: 1.1em;
				margin: 0 0 0.3em;
			}

			#page-body {
				margin: 2em 1em 1.25em 18em;
			}

			h2 {
				margin-top: 1em;
				margin-bottom: 0.3em;
				font-size: 1em;
			}

			p {
				line-height: 1.5;
				margin: 0.25em 0;
			}

			#controller-list ul {
				list-style-position: inside;
			}

			#controller-list li {
				line-height: 1.3;
				list-style-position: inside;
				margin: 0.25em 0;
			}

			@media screen and (max-width: 480px) {
				#status {
					display: none;
				}

				#page-body {
					margin: 0 1em 1em;
				}

				#page-body h1 {
					margin-top: 0;
				}
			}
		</style>
	</head>
	<body>

		<a href="#page-body" class="skip"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div id="status" role="complementary">
			<h1>Directories</h1>
			<ul>
				<li><g:link controller="physician">Physicians Directory</g:link></li>
                <li><g:link controller="clinic">Clinics Directory</g:link></li>
                <li><g:link controller="condition">Browse Conditions</g:link></li>
                <li><g:link controller="publication">Physicians Publications</g:link> </li>

			</ul>
			<h1>Admin Tools</h1>
			<ul>
                <li><g:link controller="login">Login</g:link> </li>
                <li><g:link controller="logout">Logout</g:link> </li>
                <li><g:link controller="user">User Console</g:link> </li>
                <li><g:link controller="role">Role Console</g:link> </li>
			</ul>
            <br/>
            <h4>Installed Plugins</h4>
            <ul style="font-weight:100;font-size:12px;">
                <g:each var="plugin" in="${applicationContext.getBean('pluginManager').allPlugins}">
                    <li>${plugin.name} - ${plugin.version}</li>
                </g:each>
            </ul>

		</div>
		<div id="page-body" role="main">
			<h1>Welcome to CSCI E-56 Physicians Database</h1>
			<p>
                Please use the left navigation menu to browse through the various directories available in this application.

			</p>

            <h2><u>Technical Specification</u></h2>
            <h3>Spring Security</h3>
            <p>
                Spring Security is applied throughout the entire application. All the directories and detail pages are
                viewable anonymously, while any Create/Update/Delete actions would prompt for a ROLE_USER credential.
                Only administrators(ROLE_ADMIN) are allowed to access the user console and role console.
            </p>

            <h3>AWS S3 Integration</h3>
            <p>
                awssdk plugin has been employed to store pictures for the physician profiles. Image size is limited to 2MB.
                <br/>
                <asset:image src="Physician_List.png" style="width:600px;" alt="Physician Profile"/><br/>
            </p>

            <h3>Google Maps</h3>
            <p>
                Google maps were enabled for clinics which have valid latitude and longitude loaded.<br/>
                <asset:image src="Show_Clinic.png" style="width:600px;" alt="Clinic Map"/><br/>
            </p>

            <h3>Other Integration Notes</h3>
            <p>
                Various file upload plugins have been tested to minimize development effort needed for physician picture upload.
                The following plugins were tried but yielded problem with the version of the Grails being used for this application.
                <br/>
                <b>:bootstrap-file-upload:2.1.2</b>
                <br/>
                bootstrap file upload plugin which depends on jquery and jqueryui but the dependencies are never called out in documentation.
                <br/>
                <b>:ajax-uploader:1.1</b>
                <br/>
                old plugin that works ok with pre Grails-2.3. In Grails 2.4 the codehaus ConfigurationHolder is deprecated and this plugin
                wouldn't start in Grails 2.4.<br/>
                <b>:file-uploader:1.2.1</b>
                <br/>
                same problem as ajax-uploader
                <br/>
            </p>

		</div>
	</body>
</html>
