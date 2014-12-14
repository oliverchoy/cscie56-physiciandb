package com.harvard.cscie56

import grails.test.mixin.Mock
import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(Condition)
@Mock(Condition)
class ConditionSpec extends Specification {

    def setup() {
    }

    def cleanup() {
    }

    void "Test condition required fields"() {
        when: 'Condition name is missing'
        def condition = new Condition()
        then: 'Validation should fail'
        !condition.validate()

        when: 'Condition name is present'
        condition = new Condition(
                conditionName: 'Test Condition Name'
        )
        then: 'Validation should be successful'
        condition.validate()
    }
}
