#!/usr/bin/env coffee

{ Js2Xml } = require "../lib/js2xml"
assert = require "assert"

person =
  name: "Phil Jackson"
  mood: "Bored"
  dislikes: [ "xml", "murderers" ]

assert.ok js2xml = new Js2Xml "root"
