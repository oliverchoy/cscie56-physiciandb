package com.harvard.cscie56

import grails.test.mixin.Mock
import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(Physician)
@Mock(Physician)
class PhysicianSpec extends Specification {

    def setup() {
    }

    def cleanup() {
    }

    void "Test Physicians input"() {
        when: 'Physician first name is missing'
        def physician = new Physician()
        then: 'validation should fail'
        !physician.validate()

        when: 'Physician last name is missing'
        physician = new Physician(
                firstName: 'Oliver'
        )
        then: 'validation should fail'
        !physician.validate()

        when: 'Physician NPI is msising'
        physician = new Physician(
                firstName: 'Oliver',
                lastName: 'Choy'
        )
        then: 'validation should fail'
        !physician.validate()
    }

    void "Test get physician full name"() {
        when: 'Physician first name and last name entered'
        def physician = new Physician(
                firstName: 'Oliver',
                lastName: 'Choy'
        )
        then: 'Get full name method should yield full name'
        physician.getFullName().equals('Choy, Oliver')
    }

    void "Test NPI format"() {
        when: 'NPI has incorrect format'
        def physician = new Physician(
                firstName: 'Oliver',
                lastName: 'Choy',
                npi: 'abcdefgh'
        )
        then: 'Valiation should fail'
        !physician.validate()
    }
}
