package com.harvard.cscie56



import grails.test.mixin.*
import spock.lang.*

@TestFor(PhysicianController)
@Mock(Physician)
class PhysicianControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        params["firstName"] = 'Oliver'
        params["lastName"] = 'Choy'
        params["npi"] = 123456789
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.physicianInstanceList
            model.physicianInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.physicianInstance!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'POST'
            def physician = new Physician()
            physician.validate()
            controller.save(physician)

        then:"The create view is rendered again with the correct model"
            model.physicianInstance!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            physician = new Physician(params)

            controller.save(physician)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/physician/show/1'
            controller.flash.message != null
            Physician.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def physician = new Physician(params)
            controller.show(physician)

        then:"A model is populated containing the domain instance"
            model.physicianInstance == physician
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def physician = new Physician(params)
            controller.edit(physician)

        then:"A model is populated containing the domain instance"
            model.physicianInstance == physician
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'POST'
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/physician/index'
            flash.message != null


        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def physician = new Physician()
            physician.validate()
            controller.update(physician)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.physicianInstance == physician

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            physician = new Physician(params).save(flush: true)
            controller.update(physician)

        then:"A redirect is issues to the show action"
            response.redirectedUrl == "/physician/show/$physician.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'DELETE'
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/physician/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def physician = new Physician(params).save(flush: true)

        then:"It exists"
            Physician.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(physician)

        then:"The instance is deleted"
            Physician.count() == 0
            response.redirectedUrl == '/physician/index'
            flash.message != null
    }
}
