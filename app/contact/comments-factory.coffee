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
        @getComments()
      getComments: ->
        request = $http.get @url
        request
          .then (result) =>
            @comments=result.data
      putComments:(data) ->
        request = $http.put @url, data
        request
          .success (result) ->
            result
          .error (err) ->
            throw Error "Error adding comment"
      putComment:(item) ->
        @comments.push item
        request = $http.put @url, @comments
        request
          .success (result) ->
            result
          .error (err) ->
            throw Error "Error adding comment"
      updateVotes:(item) ->
        id = @comments.indexOf item
        @comments[id]=item
        request = $http.put @url, @comments
        request
          .success (result) ->
            result
          .error (err) ->
            throw Error "Error adding comment"
        
        
  ]
