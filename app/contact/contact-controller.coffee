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
      @comments = resp
    @submit = () ->
      @form.votes=0
      @form.average=0
      CommentsFactory.putComment(@form).then ->
        alert "Comment added succesfully"
      @form = {}
    @submitVote = (item) ->
      ###
        I was trying to do it in 1 line, but coffee compiler didn't let me
        because of line length.
        Just adding the comment value, and recalculating the new average
        valoration
      ###
      total=item.average*item.votes++
      total=(total+parseInt(item.userVote))/item.votes
      item.average=total
      ###
        I delete this property because i don't need it more by the moment,
        and don't want to save it in the "database"
      ###
      delete item.userVote
      ###
        Pushing the results on the "database"
      ###
      CommentsFactory.updateVotes(item).then ->
        alert "Thanks for the feedback!"

angular
  .module('contact')
  .controller 'ContactCtrl', ContactCtrl