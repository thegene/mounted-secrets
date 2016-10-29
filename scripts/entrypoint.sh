#!/bin/bash

# import keys
scripts/import-key.sh

# generate single-use-secrets
scripts/create-secrets.sh

# remove keys from gpg
scripts/remove-key.sh

# unset passphrase
unset SECRETS_PASSPHRASE

cp scripts/get-secrets.sh secrets/

exec $@
