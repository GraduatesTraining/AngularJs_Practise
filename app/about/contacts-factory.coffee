'use strict'

###*
 # @ngdoc service
 # @name about.factory:Contacts

 # @description

###
angular
  .module 'about'
  .factory 'ContactsFactory', ['$http', ($http) ->
    new class Contacts
      constructor: ->
        @url = "https://awesomeangularjs.firebaseio.com/contacts.json"
        @getContacts()
    
      getContacts: ->
        request = $http.get @url
        request
          .success (result) =>
            @contacts = result.data
          .error (err) =>
            @contacts = {}
            throw Error "Error reading contacts"
          

  ]