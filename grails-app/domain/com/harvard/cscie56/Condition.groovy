package com.harvard.cscie56

class Condition {

    String conditionName
    String symptoms
    String causes
    String treatments

    static constraints = {
        conditionName (blank: false, nullable: false, unique: true)
        symptoms (nullable: true)
        causes (nullable: true)
        treatments (nullable: true)
    }
}
