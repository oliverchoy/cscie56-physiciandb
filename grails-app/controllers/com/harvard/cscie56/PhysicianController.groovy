package com.harvard.cscie56

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
@Secured(['ROLE_USER','ROLE_ADMIN'])
class PhysicianController {

    static allowedMethods = [save: "POST", update: "POST", delete: "DELETE"]

    def fileUploadService

    @Secured(['IS_AUTHENTICATED_ANONYMOUSLY'])
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Physician.list(params), model:[physicianInstanceCount: Physician.count()]
    }

    @Secured(['IS_AUTHENTICATED_ANONYMOUSLY'])
    def show(Physician physicianInstance) {
        log.debug "test"
        respond physicianInstance
    }

    def create() {
        log.debug "test"
        respond new Physician(params)
    }

    @Transactional
    def save(Physician physicianInstance) {
        if (physicianInstance == null) {
            notFound()
            return
        }

        if (physicianInstance.hasErrors()) {
            respond physicianInstance.errors, view:'create'
            return
        }

        def pictureFile = request.getFile('physicianPicture')
        if (pictureFile && !pictureFile.empty && pictureFile.size < 2000000) {
            log.debug("File size: " + pictureFile.getSize())
            String newFileNameBase = UUID.randomUUID().toString()
            String originalFileExtension = pictureFile.originalFilename.substring(pictureFile.originalFilename.lastIndexOf("."))
            String newFileName = newFileNameBase + originalFileExtension

            //def webRootDir = servletContext.getRealPath("/")
            //def tmpDir = new File(webRootDir, "/tmp")
            //tmpDir.mkdir()
            File newFile = new File("/tmp", pictureFile.originalFilename)
            pictureFile.transferTo(newFile)
            fileUploadService.upload(newFile, newFileName)

            physicianInstance.picturePath = "https://s3-us-west-2.amazonaws.com/cscie56-final/" + newFileName
        }

        physicianInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'physician.label', default: 'Physician'), physicianInstance.id])
                redirect physicianInstance
            }
            '*' { respond physicianInstance, [status: CREATED] }
        }
    }

    def edit(Physician physicianInstance) {
        respond physicianInstance
    }

    @Transactional
    def update(Physician physicianInstance) {
        if (physicianInstance == null) {
            notFound()
            return
        }

        if (physicianInstance.hasErrors()) {
            respond physicianInstance.errors, view:'edit'
            return
        }

        def pictureFile = request.getFile('physicianPicture')
        if (pictureFile && !pictureFile.empty && pictureFile.size < 2000000) {
            log.debug("File size: " + pictureFile.getSize())
            String newFileNameBase = UUID.randomUUID().toString()
            String originalFileExtension = pictureFile.originalFilename.substring(pictureFile.originalFilename.lastIndexOf("."))
            String newFileName = newFileNameBase + originalFileExtension

            def webRootDir = servletContext.getRealPath("/")
            def tmpDir = new File(webRootDir, "/tmp")
            tmpDir.mkdir()
            File newFile = new File(tmpDir, pictureFile.originalFilename)
            pictureFile.transferTo(newFile)
            fileUploadService.upload(newFile, newFileName)

            physicianInstance.picturePath = "https://s3-us-west-2.amazonaws.com/cscie56-final/" + newFileName
        }

        physicianInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Physician.label', default: 'Physician'), physicianInstance.id])
                redirect physicianInstance
            }
            '*'{ respond physicianInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Physician physicianInstance) {

        if (physicianInstance == null) {
            notFound()
            return
        }

        physicianInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Physician.label', default: 'Physician'), physicianInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    @Secured(['IS_AUTHENTICATED_ANONYMOUSLY'])
    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'physician.label', default: 'Physician'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
