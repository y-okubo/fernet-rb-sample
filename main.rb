require 'fernet'

secret = `dd if=/dev/urandom bs=32 count=1 2>/dev/null | openssl base64`
token = Fernet.generate(secret, 'hello')
p token

verifier = Fernet.verifier(secret, token)
if verifier.valid?
  puts(verifier.message) # the original, decrypted message
end