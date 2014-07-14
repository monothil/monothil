package monothil

import grails.compiler.GrailsCompileStatic

/**
 * Domain class for a role.
 */
@GrailsCompileStatic
class Role {

    static final String ROLE_ADMIN = "ROLE_ADMIN"
    static final String ROLE_EXPERT = "ROLE_EXPERT"

    String authority

    static constraints = {
        authority blank: false, unique: true
    }

    @Override
    String toString() {
        authority
    }
}
