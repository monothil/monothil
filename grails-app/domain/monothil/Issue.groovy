package monothil

import org.grails.databinding.BindingFormat

/**
 * A question, an inquiry or a trouble.
 */
class Issue {
    String guid
    String subject
    String description
    String issuerName
    String issuerEmail
    Person assignee
    @BindingFormat("yyyy/MM/dd")
    Date dueDate
    Date dateCreated
    Date lastUpdated

    def beforeValidate() {
        // TODO
        // Generate GUID
        if (guid == null) {
            guid = "HOGEHGOGEHGOEHGOEHGO"
        }
    }

    static hasMany = [messages: Message]

    static constraints = {
        guid blank: false, maxSize: 100
        subject blank: false, maxSize: 100
        description blank: false, maxSize: 5000
        issuerName blank: false, maxSize: 100
        issuerEmail blank: false, email: true, maxSize: 100
        assignee nullable: true, blank: false, bindable: false
        dueDate nullable: true
        dateCreated()
        lastUpdated()
    }
}
