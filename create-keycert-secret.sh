#!/bin/bash

if [ -z "$KEY_FILE" -o -z "$CERT_FILE" ]; then
	echo "You need a KEY_FILE and CERT_FILE to be defined in the env"
	exit 5
fi

kubectl create secret tls default-cert --key ${KEY_FILE} --cert ${CERT_FILE}
