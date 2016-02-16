###global describe, beforeEach, it, expect, inject, module###
'use strict'

describe 'contactFormDirective', ->
  scope = undefined
  element = undefined

  beforeEach module('contact', 'contact/contact-form-directive-directive.tpl.html')

  beforeEach inject ($compile, $rootScope) ->
    scope = $rootScope.$new()
    element = $compile(angular.element('<contactFormDirective></contactFormDirective>')) scope

  it 'should have correct text', ->
    scope.$apply()
    expect(element.isolateScope().contactFormDirective.name).toEqual 'contactFormDirective'
