#!/bin/bash

echo "Decrypting $ENCRYPTED_SECRETS_FILE"
echo $SECRETS_PASSPHRASE | \
  gpg --passphrase-fd 0 \
  --output single-use-secrets.txt \
  --batch --yes --no-tty \
  --decrypt $ENCRYPTED_SECRETS_FILE 
