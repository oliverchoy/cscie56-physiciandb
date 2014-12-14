package com.harvard.cscie56

class Clinic {

    String clinicName
    String address
    String city
    String state
    String zip
    float latitude
    float longitude
    String phone

    String clinicDescription

    static constraints = {
        clinicName (blank: false, nullable: false)
        address (blank: false, nullable: false)
        city (blank: false, nullable: false)
        state (blank: false, nullable: false)
        zip (blank: false, nullable: false, matches:/^\d{5}$/, length:5)
        latitude (blank: true, nullable: true, matches:/^-?([1-8]?[1-9]|[1-9]0)\.{1}\d{1,6}/)
        longitude (blank: true, nullable: true, matches:/^-?([1]?[1-7][1-9]|[1]?[1-8][0]|[1-9]?[0-9])\.{1}\d{1,6}/)
    }
}
