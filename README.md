# Using Multi-Node Kubernetes Clusters

## Overview
This tutorial demonstrates how to start a multi-node clusters on [minikube](https://minikube.sigs.k8s.io) and deploy a service to it.

## Preparation
- minikube 1.10.1 or higher
- kubectl

## Steps
1. Start a cluster with 2 nodes 
```
minikube start --nodes 2 -p multinode-demo
```
2. Set default profile
```
minikube profile multinode-demo
```
3. Verify the configuration of the cluster
```
kubectl get nodes
minikube status
```
3. Deploy deployment [to-roman-numeral-deployment](k8s/deployment.yaml)
```
kubectl apply -f k8s/deployment.yaml
```
4. Verify the deployment
```
kubectl rollout status deployment/to-roman-numeral-deployment
```
5. Check the IP addresses of our pods, to note for future reference
```
kubectl get pods -o wide
```
6. Deploy service [to-roman-numeral-svc](k8s/service.yaml) service
```
kubectl apply -f k8s/service.yaml
```
7. Obtain URL of `to-roman-numeral-svc` service

     Linux
     ```
     minikube service list
     ```
     MacOS
     ```
     minikube service --url to-roman-numeral-svc
     ```
8. Run the service by opening the URL in the web browser

## Cleanup
1. Remove deployed service
```
kubectl delete service to-roman-numeral-svc
```
2. Remove deployment
```
kubectl delete deployment to-roman-numeral-deployment
```
3. Stop cluster
```
minikube stop -p multinode-demo
```
4. Remove cluster (profile)
```
minikube delete -p multinode-demo
```

## Reference
- [`kubectl` Cheat Sheet](https://kubernetes.io/docs/reference/kubectl/cheatsheet/)
