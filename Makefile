JS=lib/js2xml.js

all: $(JS)

clean:
	-rm -f $(JS)

%.js: %.coffee
	coffee -b -c $<

test: $(JS)
	coffee test/js2xml_test.coffee

.PHONY: clean test

