'use strict'

###*
 # @ngdoc object
 # @name about.controller:AboutCtrl

 # @description

###

  
class AboutCtrl
  @$inject = ['ContactsFactory']
  constructor: (ContactsFactory) ->
    @ctrlName = 'AboutCtrl'
    @contacts = {}
    ContactsFactory.getContacts().then (data) =>
      @contacts = data
      console.log @contacts
angular
  .module('about')
  .controller 'AboutCtrl', AboutCtrl
  

  
