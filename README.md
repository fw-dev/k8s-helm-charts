# FileWave Multiple Servers setup
This Helm chart can be used to deploy multiple FileWave installation running behind a LoadBalancer. 

## Requirements
In order to install correctly the helm chart, the following steps need to be executed first

### Install Voyager Ingress
NGINX ingress does not satisfy all the needs of FileWave regarding Port Forwarding, hence Voyager ingress (based on HA Proxy) needs to be installed.

In order to install it, please refer to: https://github.com/appscode/voyager/blob/master/docs/setup/install.md (make sure you select the correct version for your k8s environemnt).

### Ensure Helm is correctly installed & configured
If you are using Rancher then [follow their instructions here | https://rancher.com/docs/rancher/v2.x/en/installation/ha/helm-init/]

### Create TLS secret in Kubernetes
FileWave uses encrypted connections and it requires a certificate on its LoadBalancer. Please proceed as following to generate a correct secret in kubernetes.

```bash
export KEY_FILE=...
export CERT_FILE=...
./create-keycert-secret.sh
```

### Create secret for pulling docker images
FileWave repos in dockerHub are private, you will need to create a secret in order for your cluster to correctly pull them. Pleae proceed as following to generate a correct secret in kubernetes.

```bash
export DOCKER_USER=...
export DOCKER_PWD=...
export DOCKER_EMAIL=...
./create-docker-secret.sh
```
