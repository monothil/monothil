//= require angular
//= require angular-resource
//= require xeditable
//= require_tree model
//= require_tree controller
//= require_self

/// <reference path='controller/issue-controller.ts' />

module monothil {
    'use strict';

    angular.module('monothil', ['ngResource', 'xeditable'])
        .run((editableOptions) => {
            editableOptions.theme = 'bs3';
        })
        .controller(monothil.controller);
}
