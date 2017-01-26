#!/usr/bin/env coffee

libxml = require "libxmljs"

{ Js2Xml } = require "../lib/js2xml"
assert = require "assert"

person =
  name: "Phil Jackson"
  mood: "Bored"
  stuff: [ "xml", "murderers", 2, 2.3, { one: { two: "three" } } ]
  morestuff:
    milkshake: "banana"
    bored: true

assert.ok js2xml = new Js2Xml "person", person
assert.ok output = js2xml.toString()

doc = libxml.parseXmlString output
assert.ok doc

assert.ok doc.get "/person"
assert.ok doc.get "/person/name[text()='Phil Jackson']"
assert.ok doc.get "/person/mood[text()='Bored']"

for dislike in [ "xml", "murderers", "2", "2.3" ]
  assert.ok doc.get "/person/stuff/item[text()='#{dislike}']"

assert.ok doc.get "/person/stuff/item/one/two[text()='three']"

assert.ok doc.get "/person/morestuff/milkshake[text()='banana']"
assert.ok doc.get "/person/morestuff/bored[text()='true']"

# check overriding pluralisation works

class AppleXml extends Js2Xml
  @map =
    "apples": "apple"

  pluralisation: ( name ) ->
    return @constructor.map[ name ] or "item"

fruit =
  apples: [ "Granny Smith", "Adam's", "Ambrosia" ]

assert.ok js2xml = new AppleXml "fruit", fruit
assert.ok output = js2xml.toString()

doc = libxml.parseXmlString output
assert.ok doc

assert.ok doc.get '/fruit/apples/apple[text()="Ambrosia"]'

console.log( "All passed." )
