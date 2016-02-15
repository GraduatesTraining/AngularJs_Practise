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
    ContactsFactory.getContacts().then (resp) =>
      @contacts = resp.data
    
    
    
angular
  .module('about')
  .controller 'AboutCtrl', AboutCtrl
  

  
