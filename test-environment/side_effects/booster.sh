#!/bin/bash
set -e

# Usage:   $ ./booster.sh <command> <name>
# Example: $ ./booster.sh restart chained-1
# Available commands: start, stop, restart

# Accept only known commands.
if [ "$1" != "start" ] && [ "$1" != "stop" ] && [ "$1" != "restart" ]
then
 echo "Error: \"$1\" command not found"
 exit 1
fi

# Ensure cwd is the location of the script.
cd "${0%/*}"

# Ensure booster is present in the configuration file.
if ! grep -q " $2" ../values.yaml
then
  echo "Error: \"$2\" not found in configuration file"
  exit 1
fi

# Find pod that is running booster container and execute the command.
ENVIRONMENT_NAME=$(grep "environmentName" ../values.yaml | cut -d' ' -f2)
BOOSTER_POD_ID=$(kubectl get pods -o=name | grep "$ENVIRONMENT_NAME-booster-$2" | sed "s/^.\{4\}//")
kubectl exec -ti "$BOOSTER_POD_ID" -- /etc/init.d/fw-booster "$1"
