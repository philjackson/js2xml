# About

A very simple library that converts a simple data structure into
XML. Doesn't support namespaces or attributes, just very simple
output. This allows you to write JSON and XML from the same structure
without a middle-man.

It's written in Coffeescript but the JS is included.

# Installing

    $ npm install js2xml

# Usage

    var Js2Xml = require("js2xml").Js2Xml;

    var person = {
      name: "Phil Jackson",
      mood: "Bored",
      stuff: [ "love, "puppies", 2, 2.3, { one: { two: "three" } } ],
      morestuff: { milkshake: "banana" }
    };

    var js2xml = new Js2Xml("person", person);
    js2xml.toString();

Gives:

    <?xml version="1.0" encoding="UTF-8"?>
    <person>
      <name>Phil Jackson</name>
      <mood>Bored</mood>
      <stuff>
        <item>love</item>
        <item>puppies</item>
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

# Pluralisation of lists

Here's how you might override the pluralisation function to deal with
anonymous list items in Coffeescript:

    class AppleXml extends Js2Xml
      @map =
        "apples": "apple"

      pluralisation: ( name ) ->
        return @constructor.map[ name ] or "item"
