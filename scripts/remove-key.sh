#!/bin/bash

gpg --batch --yes --delete-secret-keys \
  `gpg --list-secret-keys --with-colons --fingerprint | \
  sed -n 's/^fpr:::::::::\([[:alnum:]]\+\):/\1/p'`
