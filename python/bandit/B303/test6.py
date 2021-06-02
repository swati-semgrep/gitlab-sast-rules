#!/usr/bin/env python

from Crypto.Hash import SHA as pycrypto_sha
from Cryptodome.Hash import SHA as pycryptodomex_sha

pycrypto_sha.new()

pycryptodomex_sha.new()
