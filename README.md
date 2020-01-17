# Kubernetes configs

Scripts for kubernetes deployed with docker-desktop

## Prerequisites

* docker-desktop
* bash

## Usage

Run deploy script

## Kubernetes dashboard

### Installation

[deploying-the-dashboard-ui](https://kubernetes.io/docs/tasks/access-application-cluster/web-ui-dashboard/#deploying-the-dashboard-ui)

### connect to dashboard

[accessing-the-dashboard-ui](https://kubernetes.io/docs/tasks/access-application-cluster/web-ui-dashboard/#accessing-the-dashboard-ui)

1. get cluster active context

    ```sh
    kubectl config get-contexts
    ```

1. generate token

    ```powershell
    $TOKEN=((kubectl -n kube-system describe secret default | Select-String "token:") -split " +")[1]
    # where docker-for-desktop is active cluster context
    kubectl config set-credentials docker-for-desktop --token="${TOKEN}"
    ```

1. run proxy `kubectl proxy`
1. open `http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/`
1. Click on Kubeconfig and select the “config” file under C:\Users\\`<Username>`\\.kube\config

## Templates

* [Local Docker Registry](./docker-registry/README.md)
