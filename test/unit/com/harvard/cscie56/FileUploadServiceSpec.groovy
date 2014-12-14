package com.harvard.cscie56

import grails.test.mixin.TestFor
import org.codehaus.groovy.grails.plugins.testing.GrailsMockMultipartFile
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.services.ServiceUnitTestMixin} for usage instructions
 */
@TestFor(FileUploadService)
class FileUploadServiceSpec extends Specification {

    def fileUploadService = Mock(FileUploadService)

    def setup() {
    }

    def cleanup() {
    }

    void "Test upload service"() {
        when: 'an invalid file is supplied to the file upload service'
        def file = new File('somefile')


        then: 'upload should fail'
        !fileUploadService.upload(file, 'blah.jpg')
    }
}
