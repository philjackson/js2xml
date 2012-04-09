# About

A very simple library that converts a simple data structure into
XML. Doesn't support namespaces or attributes, just very simple
output. This allows you to write JSON and XML from the same structure
without a middle-man.

It's written in Coffeescript but the JS is included.

# Installing

    $ npm install js2xml

# Usage

    { Js2Xml } = require "js2xml"

    person =
      name: "Phil Jackson"
      mood: "Bored"
      stuff: [ "xml", "murderers", 2, 2.3, { one: { two: "three" } } ]
      morestuff:
        milkshake: "banana"

    # optionally takes version (default "1.0") and encoding (default
    # "utf-8")
    js2xml = new Js2Xml "person", person
    js2xml.toString()

Gives:

    <?xml version="1.0" encoding="UTF-8"?>
    <person>
      <name>Phil Jackson</name>
      <mood>Bored</mood>
      <stuff>
        <item>xml</item>
        <item>murderers</item>
        <item>2</item>
        <item>2.3</item>
        <item>
          <one>
            <two>three</two>
          </one>
        </item>
      </stuff>
      <morestuff>
        <milkshake>banana</milkshake>
      </morestuff>
    </person>
