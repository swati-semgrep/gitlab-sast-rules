from cryptography.hazmat.primitives.ciphers import Cipher
from cryptography.hazmat.primitives.ciphers import algorithms


cipher = Cipher(algorithms.Blowfish(key), mode=None, backend=default_backend())
encryptor = cipher.encryptor()
ct = encryptor.update(b"a secret message")



