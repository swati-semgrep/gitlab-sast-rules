#!/usr/bin/env python


from Crypto.Hash import MD4 as pycrypto_md4
from Cryptodome.Hash import MD4 as pycryptodomex_md4


pycrypto_md4.new()

pycryptodomex_md4.new()

