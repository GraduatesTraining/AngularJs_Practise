'use strict'

###*
 # @ngdoc object
 # @name contact.controller:ContactCtrl

 # @description

###
class ContactCtrl
  @$inject=['$http']
  constructor: ->
    @ctrlName = 'ContactCtrl'
    @comments=[]
    @form={}
    @submit = () ->
      @comments.push @form
      @form = {}
      
angular
  .module('contact')
  .controller 'ContactCtrl', ContactCtrl