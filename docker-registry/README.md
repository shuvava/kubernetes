# Docker Registry

Deploying a Docker Registry, with persistent storage and local-only access, on your Kubernetes cluster

## Run

```sh
cd docker-registry
./deploy.sh
```

## Docker Configuration

1. open docker settings
1. go to `Deamon` tabs
1. add into insecure registries new line `127.0.0.1:30500`. you can use any local IP address instead

## Usage

```sh
docker tag alpine 127.0.0.1:30500/alpine
docker push 127.0.0.1:30500/alpine
curl http://127.0.0.1:30500/v2/_catalog
```

expected output {"repositories":["alpine"]}
