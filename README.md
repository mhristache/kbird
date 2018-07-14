# kbird

BIRD routing daemon for Kubernetes

## Usage

1. Create a Kubernetes `configMap` including BIRD2 config as `bird.conf` file

```bash
kubectl create configmap bird-config --from-file=bird.conf
```

2. Deploy BIRD as Kubernetes `DaemonSet`

```bash
kubectl apply -f https://raw.githubusercontent.com/maximih/kbird/master/kubernetes/bird.yaml
```
