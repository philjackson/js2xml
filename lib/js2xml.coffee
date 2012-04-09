libxml = require "libxmljs"

class exports.Js2Xml
  constructor: ( root_element_name, @struct ) ->
    @doc = libxml.Document()
    root = @doc.node root_element_name

  pluralisation: ->
    return "item"

  traverse: ( structure, document, name ) ->
    if typeof structure in [ "string" ]
      document.text = structure

  encode: ->
    @traverse @struct, @root, @root_element_name

  toXml: ->
    @doc.toXml()
