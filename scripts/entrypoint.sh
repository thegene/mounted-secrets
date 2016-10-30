#!/bin/bash

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

exec $@
