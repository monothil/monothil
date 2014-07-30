/// <reference path="../typings/angularjs/angular-resource.d.ts" />

module monothil.model {
    'use strict';

    import IResource = ng.resource.IResource

    export interface Issue extends IResource<Issue> {
        id: number;
        subject: string;
        description: string;
        issuerName: string;
        issuerEmail: string;
        assignee: string;
        dueDate: string;
        dateCreated: string;
        lastUpdated: string;
    }
}
