'use strict'

###*
 # @ngdoc object
 # @name contact.controller:ContactCtrl

 # @description

###
class ContactCtrl
  @$inject=['CommentsFactory']
  constructor: (CommentsFactory) ->
    @ctrlName = 'ContactCtrl'
    @comments=[]
    @form={}
    CommentsFactory.getComments().then (resp) =>
      @comments = resp.data
    @submit = () ->
      @comments.push @form
      CommentsFactory.putComment(@comments).then ->
        alert "Comment added succesfully"
      @form = {}
angular
  .module('contact')
  .controller 'ContactCtrl', ContactCtrl