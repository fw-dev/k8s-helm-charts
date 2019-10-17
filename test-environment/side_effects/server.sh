#!/bin/bash
set -e

# Usage:   $ ./server.sh <command>
# Example: $ ./server.sh restart
# Available commands: start, stop, restart

# Accept only known commands.
if [ "$1" != "start" ] && [ "$1" != "stop" ] && [ "$1" != "restart" ]
then
 echo "Error: \"$1\" command not found"
 exit 1
fi

# Ensure cwd is the location of the script.
cd "${0%/*}"

# Find pod that is running server container and execute the command.
ENVIRONMENT_NAME=$(grep "environmentName" ../values.yaml | cut -d' ' -f2)
SERVER_POD_ID=$(kubectl get pods -o=name | grep "$ENVIRONMENT_NAME-server" | sed "s/^.\{4\}//")
kubectl exec -ti "$SERVER_POD_ID" -- /etc/init.d/fw-server "$1"
