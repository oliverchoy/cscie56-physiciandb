package com.harvard.cscie56

import grails.transaction.Transactional

@Transactional
class DataService {

    def save(domainInstance) {
        if (domainInstance) {
            try {
                domainInstance.save flush:true
                return true
            } catch (Exception ex) {
                log.error(ex.getMessage())
                return false
            }
        }
    }

    def delete(domainInstance) {
        if (domainInstance) {
            try {
                domainInstance.delete flush:true
                return true
            } catch (Exception ex) {
                log.error(ex.getMessage())
                return false
            }
        }
    }
}
