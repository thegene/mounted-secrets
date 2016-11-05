# Description

Provides a container which creates single-use secrets.txt files.

I was trying to solve a few things:
- Environment variables are not a great place to keep secrets lying around
- We don't want files sitting around which have plain text secrets in them
- A way to handle decrypting secrets which is agnostic of the hosting environment (like AWS)

# Usage

This container will create a single use secrets file that can be mounted into another container by mounting to the `/secrets` directory.
It uses a key located at `/keys/secrets_key` with GnuPG to decrypt a file located at `/encrypted/secrets.gpg`. Both may be overridden with ENV variables `KEY_PATH` and `ENCRYPTED_SECRETS_FILE`.
The passphrase for the mounted secret key should be set with `SECRETS_PASSPHRASE`, which is unset after the script is built so it won't be available as an ENV var in the container.
The subsequent secrets file is located at `/secrets/secrets.sh` and is intended to be executed by whatever container need them. The script `echo`'s the contents of the secrets file, so one could have it contain whatever ENV vars the container needs, so if your encrpyted secrets file contains `FOO=bar COLOR=blue` you could use it:
```
env $(/secrets/secrets.sh | tr "\\n" " ") some_command_needing_secret_env_vars
```. This will prevent the secrets being set in ENV.

# Example

```
docker run \
  -e SECRETS_PASSPHRASE=testing1 \
  -v /path/to/encrypted:/encrypted \
  -v /path/to/keys:/keys \
  -v secrets:/secrets
  thegene/mounted-secrets
```

you should then see a file locally at `secrets/secrets.sh`. Of course you probably want to mount it into another container.
