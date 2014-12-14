package com.harvard.cscie56



import grails.test.mixin.*
import spock.lang.*

@TestFor(ConditionController)
@Mock(Condition)
class ConditionControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        params["conditionName"] = 'Test Condition Name'
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.conditionInstanceList
            model.conditionInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.conditionInstance!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'POST'
            def condition = new Condition()
            condition.validate()
            controller.save(condition)

        then:"The create view is rendered again with the correct model"
            model.conditionInstance!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            condition = new Condition(params)

            controller.save(condition)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/condition/show/1'
            controller.flash.message != null
            Condition.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def condition = new Condition(params)
            controller.show(condition)

        then:"A model is populated containing the domain instance"
            model.conditionInstance == condition
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def condition = new Condition(params)
            controller.edit(condition)

        then:"A model is populated containing the domain instance"
            model.conditionInstance == condition
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'PUT'
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/condition/index'
            flash.message != null


        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def condition = new Condition()
            condition.validate()
            controller.update(condition)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.conditionInstance == condition

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            condition = new Condition(params).save(flush: true)
            controller.update(condition)

        then:"A redirect is issues to the show action"
            response.redirectedUrl == "/condition/show/$condition.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'DELETE'
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/condition/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def condition = new Condition(params).save(flush: true)

        then:"It exists"
            Condition.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(condition)

        then:"The instance is deleted"
            Condition.count() == 0
            response.redirectedUrl == '/condition/index'
            flash.message != null
    }
}
