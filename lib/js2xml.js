var libxml;

libxml = require("libxmljs");

exports.Js2Xml = (function() {

  function Js2Xml(root_element_name, struct, xml_version, encoding) {
    var root;
    if (xml_version == null) xml_version = "1.0";
    if (encoding == null) encoding = "UTF-8";
    this.doc = libxml.Document(xml_version, encoding);
    root = this.doc.node(root_element_name);
    this.convert(struct, root, root_element_name);
  }

  Js2Xml.prototype.pluralisation = function(name) {
    return "item";
  };

  Js2Xml.prototype.convert = function(structure, document, name) {
    var item, value, _i, _len, _ref;
    if ((_ref = typeof structure) === "string" || _ref === "number") {
      document.text(structure);
    } else if (typeof structure === "object" && Array.isArray(structure)) {
      for (_i = 0, _len = structure.length; _i < _len; _i++) {
        item = structure[_i];
        this.convert(item, document.node(this.pluralisation(name)), name);
      }
    } else if (typeof structure === "object") {
      for (name in structure) {
        value = structure[name];
        this.convert(value, document.node(name), name);
      }
    }
    return this;
  };

  Js2Xml.prototype.toString = function() {
    return this.doc.toString();
  };

  return Js2Xml;

})();
