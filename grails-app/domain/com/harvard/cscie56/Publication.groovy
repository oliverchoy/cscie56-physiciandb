package com.harvard.cscie56

class Publication {

    String title
    Date publicationDate
    String publicationAbstract
    String publicationUrl

    static belongsTo = [physician: Physician]


    static constraints = {
    }
}
