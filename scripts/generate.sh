#!/bin/bash

# check required ENV

if [ -z $SECRETS_PASSPHRASE]; then
  echo "SECRETS_PASSPHRASE must be set";
  exit 1;
fi

if [ -z $ENCRYPTED_SECRETS_FILE]; then
  echo "ENCRYPTED_SECRETS_FILE must be set";
  exit 1;
fi

if [ -z $KEY_PATH]; then
  echo "KEY_PATH must be set";
  exit 1;
fi

# check for required files
if [ ! -f $KEY_PATH ]; then
  echo "Key file missing: $KEY_PATH";
  exit;
fi

if [ ! -f $ENCRYPTED_SECRETS_FILE ]; then
  echo "No encrypted secrets to decryptat $ENCRYPTED_SECRETS_FILE";
  exit;
fi

# import keys
/scripts/import-key.sh

# generate single-use-secrets
/scripts/decrypt-secrets.sh

# create secrets file
/scripts/create-secrets.sh

# remove keys from gpg
/scripts/remove-key.sh

# unset passphrase
unset SECRETS_PASSPHRASE
