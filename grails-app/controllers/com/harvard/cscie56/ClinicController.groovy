package com.harvard.cscie56

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Secured(['ROLE_USER','ROLE_ADMIN'])
class ClinicController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def dataService

    @Secured(['IS_AUTHENTICATED_ANONYMOUSLY'])
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Clinic.list(params), model:[clinicInstanceCount: Clinic.count()]
    }

    @Secured(['IS_AUTHENTICATED_ANONYMOUSLY'])
    def show(Clinic clinicInstance) {
        respond clinicInstance
    }

    def create() {
        respond new Clinic(params)
    }

    def save(Clinic clinicInstance) {
        if (clinicInstance == null) {
            notFound()
            return
        }

        if (clinicInstance.hasErrors()) {
            respond clinicInstance.errors, view:'create'
            return
        }

        dataService.save(clinicInstance)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'clinic.label', default: 'Clinic'), clinicInstance.id])
                redirect clinicInstance
            }
            '*' { respond clinicInstance, [status: CREATED] }
        }
    }

    def edit(Clinic clinicInstance) {
        respond clinicInstance
    }

    def update(Clinic clinicInstance) {
        if (clinicInstance == null) {
            notFound()
            return
        }

        if (clinicInstance.hasErrors()) {
            respond clinicInstance.errors, view:'edit'
            return
        }

        dataService.save(clinicInstance)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Clinic.label', default: 'Clinic'), clinicInstance.id])
                redirect clinicInstance
            }
            '*'{ respond clinicInstance, [status: OK] }
        }
    }

    def delete(Clinic clinicInstance) {

        if (clinicInstance == null) {
            notFound()
            return
        }

        dataService.delete(clinicInstance)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Clinic.label', default: 'Clinic'), clinicInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    @Secured(['IS_AUTHENTICATED_ANONYMOUSLY'])
    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'clinic.label', default: 'Clinic'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
