package com.harvard.cscie56

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
@Secured(['ROLE_USER','ROLE_ADMIN'])
class PublicationController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    @Secured(['IS_AUTHENTICATED_ANONYMOUSLY'])
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Publication.list(params), model:[publicationInstanceCount: Publication.count()]
    }

    @Secured(['IS_AUTHENTICATED_ANONYMOUSLY'])
    def show(Publication publicationInstance) {
        respond publicationInstance
    }

    def create() {
        respond new Publication(params)
    }

    @Transactional
    def save(Publication publicationInstance) {
        if (publicationInstance == null) {
            notFound()
            return
        }

        if (publicationInstance.hasErrors()) {
            respond publicationInstance.errors, view:'create'
            return
        }

        publicationInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'publication.label', default: 'Publication'), publicationInstance.id])
                redirect publicationInstance
            }
            '*' { respond publicationInstance, [status: CREATED] }
        }
    }

    def edit(Publication publicationInstance) {
        respond publicationInstance
    }

    @Transactional
    def update(Publication publicationInstance) {
        if (publicationInstance == null) {
            notFound()
            return
        }

        if (publicationInstance.hasErrors()) {
            respond publicationInstance.errors, view:'edit'
            return
        }

        publicationInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Publication.label', default: 'Publication'), publicationInstance.id])
                redirect publicationInstance
            }
            '*'{ respond publicationInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Publication publicationInstance) {

        if (publicationInstance == null) {
            notFound()
            return
        }

        publicationInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Publication.label', default: 'Publication'), publicationInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'publication.label', default: 'Publication'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
