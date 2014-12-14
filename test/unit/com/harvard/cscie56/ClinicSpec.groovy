package com.harvard.cscie56

import grails.test.mixin.Mock
import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(Clinic)
@Mock([Clinic])
class ClinicSpec extends Specification {

    def setup() {
    }

    def cleanup() {
    }

    void "Test success clinic input"() {

        when: 'All required inputs present'
            def clinic = new Clinic(
                    clinicName: 'Test',
                    clinicDescription: 'Test Description',
                    address: 'Test Address',
                    city: 'Test City',
                    state: 'Test State',
                    zip: '12345',
                    phone: '1231231234'
            )
        then: 'validation should be successful'
        clinic.validate()
    }

    void "Test missing attributes one by one"() {

        when: 'Clinic name is missing'
            def clinic = new Clinic(
            )
        then: 'validation should fail'
            !clinic.validate()

        when: 'Clinic Description is missing'
            clinic = new Clinic(
                clinicName: 'Test Clinic'
            )
        then: 'validation should fail'
        !clinic.validate()

        when: 'Clinic Address is missing'
            clinic = new Clinic(
                clinicName: 'Test Clinic',
                clinicDescription: 'Test Description'
            )
        then: 'validation should fail'
        !clinic.validate()

        when: 'Clinic City is missing'
        clinic = new Clinic(
                clinicName: 'Test Clinic',
                clinicDescription: 'Test Description',
                clinicAddress: '123 Test Street'
        )
        then: 'validation should fail'
        !clinic.validate()

        when: 'Clinic State is missing'
        clinic = new Clinic(
                clinicName: 'Test Clinic',
                clinicDescription: 'Test Description',
                clinicAddress: '123 Test Street',
                city: 'Test City'
        )
        then: 'validation should fail'
        !clinic.validate()

        when: 'Clinic Zip is missing'
        clinic = new Clinic(
                clinicName: 'Test Clinic',
                clinicDescription: 'Test Description',
                clinicAddress: '123 Test Street',
                city: 'Test City',
                state: 'Test'
        )
        then: 'validation should fail'
        !clinic.validate()

        when: 'Clinic phone is missing'
        clinic = new Clinic(
                clinicName: 'Test Clinic',
                clinicDescription: 'Test Description',
                clinicAddress: '123 Test Street',
                city: 'Test City',
                state: 'Test',
                zip: '12345'
        )
        then: 'validation should fail'
        !clinic.validate()
    }

    void "Test clinic zip input"() {

        when: 'Clinic zip input is wrong'
        def clinic = new Clinic(
                clinicName: 'Test',
                clinicDescription: 'Test Description',
                address: 'Test Address',
                city: 'Test City',
                state: 'Test State',
                zip: 'abcde',
                phone: '1231231234'
        )
        then: 'validation should fail'
        !clinic.validate()
    }

    void "Test 6 digit zip code"() {

        when: 'Zip code is more than 5 digits'
        def clinic = new Clinic(
                clinicName: 'Test',
                clinicDescription: 'Test Description',
                address: 'Test Address',
                city: 'Test City',
                state: 'Test State',
                zip: '123456',
                phone: '1231231234'
        )
        then: 'validation should fail'
        !clinic.validate()
    }

    void "Test coordinates input"() {
        when: 'Latitude is entered incorrectly'
        def clinic = new Clinic(
                clinicName: 'Test',
                clinicDescription: 'Test Description',
                address: 'Test Address',
                city: 'Test City',
                state: 'Test State',
                zip: '12345',
                phone: '1231231234',
                latitude: 1234.1,
                longitude: 1234.1
        )
        then: 'validation should fail'
        clinic.validate()

        when: 'Latitude/longitude has the right format'
        clinic = new Clinic(
                clinicName: 'Test',
                clinicDescription: 'Test Description',
                address: 'Test Address',
                city: 'Test City',
                state: 'Test State',
                zip: '12345',
                phone: '1231231234',
                latitude: 123.1,
                longitude: 12.1
        )
        then: 'validation should be successful'
        clinic.validate()
    }
}
