#!/bin/sh
set -e

#
# ./deploy.sh (azure|azure-local|dockerhub|dockerhub-local)

if [ "$1" = 'azure' ]; then
  ACR_PASSWORD=$(az keyvault secret show --name acr-admin-password --vault-name cdc-coe-candace | jq -r .value)
  docker login $AZURE_ACR_URL -u $AZURE_ACR_USERNAME -p "$ACR_PASSWORD"
  docker buildx build \
    --platform linux/amd64 \
    --push \
    --tag cdccandacecampbell.azurecr.io/azure-hello-world .
elif [ "$1" = 'azure-local' ]; then
  docker login cdcemmanuelapau.azurecr.io -u CDCEmmanuelApau
  docker buildx build \
    --platform linux/amd64 \
    --push \
    --tag cdcemmanuelapau.azurecr.io/azure-hello-world .
elif [ "$1" = 'dockerhub' ]; then
  docker login -u $DOCKERHUB_USERNAME -p "$DOCKERHUB_PASSWORD"
  docker buildx build \
    --platform linux/amd64 \
    --push \
    --tag cdcampbell24/hello-world:latest .
elif [ "$1" = 'dockerhub-local' ]; then
  docker buildx build \
    --platform linux/amd64 \
    --push \
    --tag etapau/azure-hello-world:latest .
fi
