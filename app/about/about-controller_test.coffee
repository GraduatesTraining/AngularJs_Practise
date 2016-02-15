###global describe, beforeEach, it, expect, inject, module###
'use strict'

describe 'AboutCtrl', ->
  ctrl = undefined

  beforeEach module 'about'

  beforeEach inject ($rootScope, $controller) ->
    ctrl = $controller 'AboutCtrl'

  it 'should have ctrlName as AboutCtrl', ->
    expect(ctrl.ctrlName).toEqual 'AboutCtrl'