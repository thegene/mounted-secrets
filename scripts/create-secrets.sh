#!/bin/bash
SECRETS_VALUE=`cat /secrets/single-use-secrets.txt` envsubst < template > secrets.sh
chmod +x secrets.sh
mv secrets.sh /secrets
rm /secrets/single-use-secrets.txt
