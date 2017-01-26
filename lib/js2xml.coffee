libxml = require "libxmljs"

class exports.Js2Xml
  constructor: ( root_element_name, struct, xml_version="1.0", encoding="UTF-8" ) ->
    @doc = libxml.Document xml_version, encoding
    root = @doc.node root_element_name

    @convert struct, root, root_element_name

  pluralisation: ( name ) ->
    return "item"

  convert: ( structure, document, name ) ->
    # String
    if typeof structure in [ "string", "number", "boolean" ]
      document.text structure.toString()

    # Array
    else if typeof structure is "object" and Array.isArray structure
      for item in structure
        @convert item, document.node( @pluralisation( name ) ), name

    # Generic object
    else if typeof structure is "object"
      for name, value of structure
        @convert value, document.node( name ), name

    return @

  toString: ->
    @doc.toString()
