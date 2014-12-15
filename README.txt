Here's the final project proposal:
Grails application for a health care directory around doctors, clinics, conditions, as well as publications. The application comes with an admin interface (secured by Spring security) where CRUD commands are available to create different assets.

Pictures can be uploaded by the application user (with credentials) or admin users where the pictures would be uploaded to Amazon S3 (plugin integration). Upon valid entries of latitude and longitude information, google maps would also be displayed for the clinics.

Application also comes with a full suite of unit tests and the application is uploaded to Heroku with MongoDB provided by Mongolab. The application is available at:

http://immense-chamber-6672.herokuapp.com/

and here's a credential where you can log into the application:
ROLE_ADMIN: admin / admin123

The roles and users are prepopulated by bootstrap and I have manually entered some data into the application through the admin interfaces.

Challenges I faced included many but mostly around plugin exploration as well as deployment to the Heroku server. Here are some notes I have captured from the plugin exploration:

Various file upload plugins have been tested to minimize development effort needed for physician picture upload. The following plugins were tried but yielded problem with the version of the Grails being used for this application. 
:bootstrap-file-upload:2.1.2 
bootstrap file upload plugin which depends on jquery and jqueryui but the dependencies are never called out in documentation. 
:ajax-uploader:1.1 
old plugin that works ok with pre Grails-2.3. In Grails 2.4 the codehaus ConfigurationHolder is deprecated and this plugin wouldn't start in Grails 2.4.
:file-uploader:1.2.1 
same problem as ajax-uploader 

The deployment to Heroku was fairly straightforward and integration with mongolab was extremely easy. However, my application has the need to write a local file using Java File API but Heroku servers are limited to only certain location for writable access and it took me a while to figure out. 

Also I figured that the heroku free tier is not powerful enough (limited memory) and I had to reload the application a few times. If you're seeing any problem with my heroku application, please refresh after a while (for server memory to free up a bit).

Finally, the source code for my application is checked in at:

https://github.com/oliverchoy/cscie56-physiciandb
