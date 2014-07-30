//= require angular
//= require angular-resource
//= require_tree model
//= require_tree controller
//= require_self

/// <reference path='controller/issue-controller.ts' />

module monothil {
    'use strict';

    angular.module('monothil', ['ngResource'])
        .controller(monothil.controller);
}
