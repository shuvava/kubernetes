#!/bin/bash
: "${PRJ_NAME:="docker-registry"}"
: "${APP_NAME:=$(echo $PRJ_NAME | awk '{print tolower($0)}')}"

if ! kubectl get ns | grep -lq "^${APP_NAME}" ; then
    echo "Create $APP_NAME namespace"
    kubectl create -f ns-${APP_NAME}.yaml
fi

echo -e "Deleting previous version of $PRJ_NAME ($APP_NAME) if it exists"
kubectl delete --ignore-not-found=true svc,pvc,deployment -l app=$APP_NAME -n $APP_NAME
#kubectl delete --ignore-not-found=true -f kubernetes/local-volumes.yaml

if ! kubectl get svc -n ${APP_NAME}| grep -lq "^registry" ; then
    echo "Create ${PRJ_NAME}::registry service"
    kubectl apply -f svc-docker-registry.yaml
fi

echo "Apply deployment ${PRJ_NAME}::registry service"
kubectl apply -f deployment.yaml
