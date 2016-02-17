'use strict'

angular
  .module 'about'
  .config ($stateProvider) ->
    $stateProvider
      .state 'about',
        url: '/about'
        templateUrl: 'about/template/about.tpl.html'
        controller: 'AboutCtrl'
        controllerAs: 'About'
