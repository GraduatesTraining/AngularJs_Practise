'use strict'

###*
 # @ngdoc object
 # @name contact.controller:ContactCtrl

 # @description

###
class ContactCtrl
  constructor: ->
    @ctrlName = 'ContactCtrl'

angular
  .module('contact')
  .controller 'ContactCtrl', ContactCtrl

ContactCtrl = () ->
  this.contact={}