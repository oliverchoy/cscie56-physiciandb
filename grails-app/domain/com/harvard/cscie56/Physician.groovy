package com.harvard.cscie56

class Physician {

    Long npi
    String firstName
    String lastName
    String picturePath

    String getFullName() {
        lastName + ", " + firstName
    }

    static hasMany = [clinics:Clinic, conditionsTreated: Condition, publications: Publication]

    static transients = ['fullName']

    static constraints = {
        npi (blank: false, nullable: false, matches:/^\d{9}$/, length:9)
        firstName (blank: false, nullable: false)
        lastName (blank: false, nullable: false)
        picturePath (blank: true, nullable: true)
        clinics (maxSize: 3)
        conditionsTreated (maxSize: 5)
        publications (maxSize: 10)
    }
}
