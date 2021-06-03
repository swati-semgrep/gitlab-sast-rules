#!/usr/bin/env python

from Crypto.Hash import MD5 as pycrypto_md5
from Cryptodome.Hash import MD5 as pycryptodomex_md5

pycrypto_md5.new()

pycryptodomex_md5.new()
