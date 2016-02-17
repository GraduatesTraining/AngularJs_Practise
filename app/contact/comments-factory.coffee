'use strict'

###*
 # @ngdoc service
 # @name contact.factory:Comments

 # @description

###
angular
  .module 'contact'
  .factory 'CommentsFactory', ['$http', ($http) ->
    new class Comments
      constructor: ->
        @url = "https://awesomeangularjs.firebaseio.com/contactForm.json"
      getComments: ->
        request = $http.get @url
        request
          .success (result) ->
            result
          .error (err) ->
            throw Error "Error retrieving comments"
      putComments:(data) ->
        request = $http.put @url, data
        request
          .success (result) ->
            result
          .error (err) ->
            throw Error "Error adding comment"
  ]
