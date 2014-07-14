package monothil

import grails.compiler.GrailsCompileStatic
import grails.plugin.springsecurity.SpringSecurityService
import org.apache.commons.lang.RandomStringUtils

/**
 * Domain class for a person.
 */
@GrailsCompileStatic
class Person {

    SpringSecurityService springSecurityService

    String username
    String password
    String salt

    String name
    String email

    final boolean enabled = true
    final boolean accountExpired = false
    final boolean accountLocked = false
    final boolean passwordExpired = false

    static hasMany = [roles: Role]

    static transients = ["springSecurityService", "enabled", "accountExpired", "accountLocked", "passwordExpired"]

    static constraints = {
        username blank: false, unique: true
        password blank: false
        salt blank: false, bindable: false
        name blank: false
        email blank: false, email: true
    }

    static mapping = {
        password column: "`password`"
        salt updateable: false
    }

    Set<Role> getAuthorities() {
        roles
    }

    def beforeValidate() {
        if (!salt) {
            salt = RandomStringUtils.randomAlphanumeric(20)
        }
    }

    def beforeInsert() {
        encodePassword()
    }

    def beforeUpdate() {
        if (isDirty("password")) {
            encodePassword()
        }
    }

    protected void encodePassword() {
        password = springSecurityService.encodePassword(password, salt)
    }
}
