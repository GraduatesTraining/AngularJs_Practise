###global describe, beforeEach, it, browser, expect ###
'use strict'


ContactPagePo = require './contact.po'

describe 'Contact page', ->
  contactPage = undefined

  beforeEach ->
    contactPage = new ContactPagePo
    browser.get '/#/contact'

  it 'should say ContactCtrl', ->
    expect(contactPage.heading.getText()).toEqual 'contact'
    expect(contactPage.text.getText()).toEqual 'ContactCtrl'
