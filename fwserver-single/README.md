# Usage and Installation
This Helm chart can be used to deploy a single FileWave server, it will get assigned an external IP if your cluster supports it.

## Requirements
In order to install correctly the helm chart, the following step needs to be executed first

### Create secret for pulling docker images
FileWave repos in dockerHub are private, you will need to create a secret in order for your cluster to correctly pull them. Pleae proceed as following to generate a correct secret in kubernetes.

```bash
create secret docker-registry regcred --docker-server=https://index.docker.io/v1/ --docker-username=${DOCKER_USER}--docker-password=${DOCKER_PWD}  --docker-email=${DOCKER_EMAIL}
```