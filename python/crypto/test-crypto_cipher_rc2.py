from Crypto.Cipher import ARC2 as pycrypto_arc2
from Cryptodome.Cipher import ARC2 as pycryptodomex_arc2
from Crypto import Random

key = b'Sixteen byte key'
iv = Random.new().read(pycrypto_arc2.block_size)
cipher = pycrypto_arc2.new(key, pycrypto_arc2.MODE_CFB, iv)
msg = iv + cipher.encrypt(b'Attack at dawn')
cipher = pycryptodomex_arc2.new(key, pycryptodomex_arc2.MODE_CFB, iv)
msg = iv + cipher.encrypt(b'Attack at dawn')

