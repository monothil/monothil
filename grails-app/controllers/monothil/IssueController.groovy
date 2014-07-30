package monothil

import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional

import static org.springframework.http.HttpStatus.*

@Secured(["hasRole('ROLE_EXPERT')"])
@Transactional(readOnly = true)
class IssueController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def springSecurityService

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Issue.list(params), model: [issueCount: Issue.count()]
    }

    def show(Issue issue) {
        respond issue
    }

    @Secured(["permitAll"])
    def secret() {
        println "SECRET!!: ${params.guid}"
        def issue = Issue.findByGuid(params.guid)
        if (issue == null) {
            notFound()
            return
        }
        respond issue, view: "show"
    }

    @Secured(["permitAll"])
    def create() {
        respond new Issue(params)
    }

    @Secured(["permitAll"])
    @Transactional
    def save(Issue issue) {
        if (issue == null) {
            notFound()
            return
        }

        if (issue.hasErrors()) {
            respond issue.errors, view: 'create'
            return
        }

        issue.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'issue.label', default: 'Issue'), issue.id])

                if (springSecurityService.loggedIn) {
                    redirect action: "show", params: [id: issue.id]
                } else {
                    redirect action: "secret", params: [guid: issue.guid]
                }
            }
            '*' { respond issue, [status: CREATED] }
        }
    }

    def edit(Issue issue) {
        respond issue
    }

    @Transactional
    def update(Issue issue) {
        if (issue == null) {
            notFound()
            return
        }

        if (issue.hasErrors()) {
            respond issue.errors, view: 'edit'
            return
        }

        issue.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Issue.label', default: 'Issue'), issue.id])
                redirect issue
            }
            '*' { respond issue, [status: OK] }
        }
    }

    @Transactional
    def delete(Issue issue) {

        if (issue == null) {
            notFound()
            return
        }

        issue.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Issue.label', default: 'Issue'), issue.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'issue.label', default: 'Issue'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
