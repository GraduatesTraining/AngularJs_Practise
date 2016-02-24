'use strict'

###*
 # @ngdoc object
 # @name contact.controller:ContactCtrl

 # @description

###
class ContactCtrl
  @$inject=['CommentsFactory', '$mdDialog', '$mdMedia']
  constructor: (@CommentsFactory, @$mdDialog, @$mdMedia) ->
    @ctrlName = 'ContactCtrl'
    @form={}
    @submit = submit
    @submitVote = submitVote
    @customFullscreen = @$mdMedia('xs') or @$mdMedia('sm')
    @DialogController = DialogController
  DialogController = (@$mdDialog)->
    @hide = () =>
      @$mdDialog.hide()
    @cancel = () =>
      @$mdDialog.cancel()
    @answer = () =>
      @mdDialog.hide()
  submit = (ev) ->
    @form.votes=0
    @form.average=0
    @CommentsFactory.putComment(@form).then =>
      @$mdDialog.show(
        @$mdDialog.alert()
          .parent(angular.element(document.querySelector('#popupContainer')))
          .clickOutsideToClose(true)
          .title('Bandera')
          .textContent('Commentary succesfully sent.')
          .ariaLabel('Alert Dialog Demo')
          .ok('Got it!')
          .targetEvent(ev)
      )
    @form = {}
  submitVote = (item, ev) ->
    ###
      I was trying to do it in 1 line, but coffee compiler didn't let me
      because of line length.
      Just adding the comment value, and recalculating the new average
      valoration
    ###
    total=item.average*item.votes++
    total=(total+parseInt item.userVote)/item.votes
    item.average=total
    ###
      I delete this property because i don't need it more by the moment,
      and don't want to save it in the "database"
    ###
    delete item.userVote
    ###
      Pushing the results on the "database"
    ###
    @CommentsFactory.updateVotes(item).then =>
      @$mdDialog.show(
        @$mdDialog.alert()
          .parent(angular.element(document.querySelector('#popupContainer')))
          .clickOutsideToClose(true)
          .title('Bandera')
          .textContent('Thanks for the feedback!')
          .ariaLabel('Alert Dialog Demo')
          .ok('Got it!')
          .targetEvent(ev)
      )
angular
  .module('contact')
  .controller 'ContactCtrl', ContactCtrl