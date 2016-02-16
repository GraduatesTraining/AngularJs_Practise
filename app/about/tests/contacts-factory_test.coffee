###global describe, beforeEach, it, expect, inject, module###
'use strict'

describe 'Contacts', ->
  factory = undefined

  beforeEach module 'about'

  beforeEach inject (Contacts) ->
    factory = Contacts

  it 'should have someValue be Contacts', ->
    expect(factory.someValue).toEqual 'Contacts'

  it 'should have someMethod return Contacts', ->
    expect(factory.someMethod()).toEqual 'Contacts'
