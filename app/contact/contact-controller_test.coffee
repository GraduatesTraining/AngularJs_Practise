###global describe, beforeEach, it, expect, inject, module###
'use strict'

describe 'ContactCtrl', ->
  ctrl = undefined

  beforeEach module 'contact'

  beforeEach inject ($rootScope, $controller) ->
    ctrl = $controller 'ContactCtrl'

  it 'should have ctrlName as ContactCtrl', ->
    expect(ctrl.ctrlName).toEqual 'ContactCtrl'

