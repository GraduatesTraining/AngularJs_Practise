'use strict'

angular
  .module 'contact'
  .config ($stateProvider) ->
    $stateProvider
      .state 'contact',
        url: '/contact/'
        templateUrl: 'contact/template/contact.tpl.html'
        controller: 'ContactCtrl'
        controllerAs: 'contact'
