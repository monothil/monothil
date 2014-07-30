class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?" {
            constraints {
                // apply constraints here
            }
        }

        "/issue"(resources: "issue")
        "/issue/secret"(controller: "issue", action:"secret")
        "/"(controller: "home", action: "index")
        "500"(view: '/error')
    }
}
