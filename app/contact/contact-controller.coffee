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
        Taking real id in array of item, because with orderBy i'm losing
        the true index of comments array
      ###
      id = @comments.indexOf item
      ###
        I was trying to do it in 1 line, but coffee compiler didn't let me
        because of line length.
        Just adding the comment value, and recalculating the new average
        valoration
      ###
      total=@comments[id].average*@comments[id].votes++
      total=(total+parseInt(@comments[id].userVote))/@comments[id].votes
      @comments[id].average=total
      ###
        I delete this property because i don't need it more by the moment,
        and don't want to save it in the "database"
      ###
      delete @comments[id].userVote
      ###
        Pushing the results on the "database"
      ###
      CommentsFactory.putComments(@comments).then ->
        alert "Thanks for the feedback!"

angular
  .module('contact')
  .controller 'ContactCtrl', ContactCtrl