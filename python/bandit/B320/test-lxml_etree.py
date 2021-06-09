#!/usr/bin/env python

import lxml.etree
import lxml
from lxml import etree
from defusedxml.lxml import fromstring
from defuxedxml import lxml as potatoe

xmlString = "<note>\n<to>Tove</to>\n<from>Jani</from>\n<heading>Reminder</heading>\n<body>Don't forget me this weekend!</body>\n</note>"
root = lxml.etree.fromstring(xmlString)
lxml.etree.RestrictedElement()
lxml.etree.GlobalParserTLS()
lxml.etree.getDefaultParser()
lxml.etree.check_docinfo()
root = fromstring(xmlString)
