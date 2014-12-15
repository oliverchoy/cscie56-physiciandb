package com.harvard.cscie56

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Secured(['ROLE_USER','ROLE_ADMIN'])
class ConditionController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def dataService

    @Secured(['IS_AUTHENTICATED_ANONYMOUSLY'])
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Condition.list(params), model:[conditionInstanceCount: Condition.count()]
    }

    @Secured(['IS_AUTHENTICATED_ANONYMOUSLY'])
    def show(Condition conditionInstance) {
        respond conditionInstance
    }

    def create() {
        respond new Condition(params)
    }

    def save(Condition conditionInstance) {
        if (conditionInstance == null) {
            notFound()
            return
        }

        if (conditionInstance.hasErrors()) {
            respond conditionInstance.errors, view:'create'
            return
        }

        dataService.save(conditionInstance)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'condition.label', default: 'Condition'), conditionInstance.id])
                redirect conditionInstance
            }
            '*' { respond conditionInstance, [status: CREATED] }
        }
    }

    def edit(Condition conditionInstance) {
        respond conditionInstance
    }

    def update(Condition conditionInstance) {
        if (conditionInstance == null) {
            notFound()
            return
        }

        if (conditionInstance.hasErrors()) {
            respond conditionInstance.errors, view:'edit'
            return
        }

        dataService.save(conditionInstance)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Condition.label', default: 'Condition'), conditionInstance.id])
                redirect conditionInstance
            }
            '*'{ respond conditionInstance, [status: OK] }
        }
    }

    def delete(Condition conditionInstance) {

        if (conditionInstance == null) {
            notFound()
            return
        }

        dataService.delete(conditionInstance)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Condition.label', default: 'Condition'), conditionInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    @Secured(['IS_AUTHENTICATED_ANONYMOUSLY'])
    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'condition.label', default: 'Condition'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
