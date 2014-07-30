/// <reference path="../typings/angularjs/angular.d.ts" />
/// <reference path="../model/Issue.ts" />

module monothil.controller {
    'use strict';

    import IResourceClass = ng.resource.IResourceClass;
    import IResourceService = ng.resource.IResourceService;
    import IScope = ng.IScope;

    import Issue = monothil.model.Issue;

    export interface IssueResource extends IResourceClass<Issue> {
    }

    export interface IIssueScope extends IScope {
        issue: Issue;
        init: (config:IIssueControllerConfig) => void;
    }

    export interface IIssueControllerConfig {
        id: number;
        resourceUrl: string;
    }

    export class IssueController {

        static $inject = ['$scope', '$resource'];

        private $issueResource:IssueResource;

        constructor(private $scope:IIssueScope, private $resource:IResourceService) {
            $scope.init = (config) => {
                this.$issueResource = <IssueResource> this.$resource(config.resourceUrl + '/:id.json', {id: '@id'}, {
                    update: {
                        method: 'PUT'
                    }
                });
                this.$scope.issue = this.$issueResource.get({id: config.id});
            }
        }
    }
}
