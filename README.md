# kbird

BIRD routing daemon for Kubernetes

## Usage

1. Create a Kubernetes `configMap` including BIRD2 config as `bird.conf` file

```bash
kubectl create configmap bird-config --from-file=bird.conf
```

2. Deploy BIRD as Kubernetes `DaemonSet`

```bash
kubectl apply -f https://raw.githubusercontent.com/mhristache/kbird/master/kubernetes/bird.yaml
```

## Update the config

BIRD2 daemon is started via a wrapper called `kbird` which is monitoring the config for changes and applies the new config automatically. 
So, to update the config it's enough to edit the `configmap` created in step 1:

```
kubectl edit configmap bird-config
```
