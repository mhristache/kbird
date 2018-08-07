# kbird

BIRD routing daemon for Kubernetes

## Usage

1. Deploy BIRD

```
kubectl create -f https://raw.githubusercontent.com/mhristache/kbird/master/kubernetes/bird.yaml
```

**Note**: BIRD is deployed as a privilegged container with a dummy config stored as `bird.conf` inside `config` configmap in the `kbird-system` namespace.


2. Prepare the BIRD config and save it locally as `bird.conf` file

3. Replace the dummy BIRD config with the one created in step 2

```
kubectl create configmap config --from-file=bird.conf --dry-run -o yaml -n kbird-system | kubectl replace configmap config -n kbird-system -f -
```

## Update the config

BIRD2 daemon is started via a wrapper called `kbird` which is monitoring the config for changes and applies the new config automatically. 
So, to update the config it's enough to edit the `configmap` created in step 1:

```
kubectl edit configmap bird-config
```

However, as the formatting of the BIRD config is messed up, it's easier to replace the configmap with a new one created from a `bird.conf` file:

```
kubectl create configmap config --from-file=bird.conf --dry-run -o yaml -n kbird-system | kubectl replace configmap config -n kbird-system -f -
```
