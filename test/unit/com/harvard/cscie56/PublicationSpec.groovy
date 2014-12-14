package com.harvard.cscie56

import grails.test.mixin.Mock
import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(Publication)
@Mock(Publication)
class PublicationSpec extends Specification {

    def setup() {
    }

    def cleanup() {
    }

    void "Test Publication required fields"() {
        when: 'Publication title is missing'
        def publication = new Publication()
        then: 'Validation should fail'
        !publication.validate()

        when: 'Publication Date is missing'
        publication = new Publication(
                title: 'Test Publication Title'
        )
        then: 'Validation should fail'
        !publication.validate()

        when: 'Publication Abstract is missing'
        publication = new Publication(
                title: 'Test Publication Title',
                publicationDate: new Date()
        )
        then: 'Validation should fail'
        !publication.validate()

        when: 'Publication URL is missing'
        publication = new Publication(
                title: 'Test Publication Title',
                publicationDate: new Date(),
                publicationAbstract: 'Test Publication Abstract'
        )
        then: 'Validation should fail'
        !publication.validate()

        when: 'Publication Physician is missing'
        publication = new Publication(
                title: 'Test Publication Title',
                publicationDate: new Date(),
                publicationAbstract: 'Test Publication Abstract',
                publicationUrl: 'http://www.test.com'
        )
        then: 'Validation should fail'
        !publication.validate()

        when: 'All Publication required fields present'
        publication = new Publication(
                title: 'Test Publication Title',
                publicationDate: new Date(),
                publicationAbstract: 'Test Publication Abstract',
                publicationUrl: 'http://www.test.com',
                physician: new Physician()
        )
        then: 'Validation should be successful'
        publication.validate()
    }
}
