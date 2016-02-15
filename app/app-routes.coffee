'use strict'

angular
  .module 'prueba'
  .config ($urlRouterProvider) ->
    $urlRouterProvider.otherwise '/home'
