###global describe, beforeEach, it, expect, inject, module###
'use strict'

describe 'Comments', ->
  factory = undefined

  beforeEach module 'contact'

  beforeEach inject (Comments) ->
    factory = Comments

  it 'should have someValue be Comments', ->
    expect(factory.someValue).toEqual 'Comments'

  it 'should have someMethod return Comments', ->
    expect(factory.someMethod()).toEqual 'Comments'
