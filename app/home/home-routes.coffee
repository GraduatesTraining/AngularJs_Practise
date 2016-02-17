'use strict'

angular
  .module 'home'
  .config ($stateProvider) ->
    $stateProvider
      .state 'home',
        url: '/home'
        templateUrl: 'home/template/home.tpl.html'
        controller: 'HomeCtrl'
        controllerAs: 'home'
