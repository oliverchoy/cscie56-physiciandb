<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
        <meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Welcome to CSCI E-56 Physicians Database</title>
	</head>
	<body>

		<div class="container">
            <div class="col-lg-3 col-md-3 col-xs-12">
                <div id="status">
                    <h3>Directories</h3>
                    <ul class="list-group">
                        <li class="list-group-item list-group-item-danger"><g:link controller="physician">Physicians Directory</g:link></li>
                        <li class="list-group-item list-group-item-danger"><g:link controller="clinic">Clinics Directory</g:link></li>
                        <li class="list-group-item list-group-item-danger"><g:link controller="condition">Browse Conditions</g:link></li>
                        <li class="list-group-item list-group-item-danger"><g:link controller="publication">Physicians Publications</g:link> </li>

                    </ul>
                    <h3>Admin Tools</h3>
                    <ul class="list-group">
                        <li class="list-group-item list-group-item-warning"><g:link controller="login">Login</g:link> </li>
                        <li class="list-group-item list-group-item-warning"><g:link controller="logout">Logout</g:link> </li>
                        <li class="list-group-item list-group-item-warning"><g:link controller="user">User Console</g:link> </li>
                        <li class="list-group-item list-group-item-warning"><g:link controller="role">Role Console</g:link> </li>
                    </ul>

                    <div class="hidden-xs hidden-sm">
                        <h4>Installed Plugins</h4>
                        <table class="table table-condensed">


                        <g:each var="plugin" in="${applicationContext.getBean('pluginManager').allPlugins}">
                            <tr class="info"><td>${plugin.name} - ${plugin.version}</td></tr>
                        </g:each>
                        </table>
                    </div>


                </div>
            </div>
            <div class="col-lg-9 col-md-9 col-xs-12">
                <div>
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
            </div>



		</div>

	</body>
</html>
