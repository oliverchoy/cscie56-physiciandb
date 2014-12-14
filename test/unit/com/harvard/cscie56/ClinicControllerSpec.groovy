package com.harvard.cscie56



import grails.test.mixin.*
import spock.lang.*

@TestFor(ClinicController)
@Mock(Clinic)
class ClinicControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        params["clinicName"]=  'Test'
        params["clinicDescription"] = 'Test Description'
        params["address"] = '123 Test Street'
        params["city"] = 'Palo Alto'
        params["state"] = 'CA'
        params["zip"] = '12345'
        params["phone"] = '123-123-1234'
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.clinicInstanceList
            model.clinicInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.clinicInstance!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'POST'
            def clinic = new Clinic()
            clinic.validate()
            controller.save(clinic)

        then:"The create view is rendered again with the correct model"
            model.clinicInstance!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            clinic = new Clinic(params)

            controller.save(clinic)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/clinic/show/1'
            controller.flash.message != null
            Clinic.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def clinic = new Clinic(params)
            controller.show(clinic)

        then:"A model is populated containing the domain instance"
            model.clinicInstance == clinic
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def clinic = new Clinic(params)
            controller.edit(clinic)

        then:"A model is populated containing the domain instance"
            model.clinicInstance == clinic
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'PUT'
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/clinic/index'
            flash.message != null


        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def clinic = new Clinic()
            clinic.validate()
            controller.update(clinic)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.clinicInstance == clinic

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            clinic = new Clinic(params).save(flush: true)
            controller.update(clinic)

        then:"A redirect is issues to the show action"
            response.redirectedUrl == "/clinic/show/$clinic.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'DELETE'
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/clinic/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def clinic = new Clinic(params).save(flush: true)

        then:"It exists"
            Clinic.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(clinic)

        then:"The instance is deleted"
            Clinic.count() == 0
            response.redirectedUrl == '/clinic/index'
            flash.message != null
    }
}
