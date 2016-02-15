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
      getContacts: ->
        request = $http.get @url
        request
          .success (result) ->
            result
          .error (err) ->
            throw Error "Error reading contacts"
  ]