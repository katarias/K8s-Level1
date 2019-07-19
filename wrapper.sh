## install kubectl which will use to manage kubernets app
gcloud components install kubectl

### Create 2 Static IP
gcloud compute addresses delete guestbook-ip --global
gcloud compute addresses delete guestbook-ip2 --global

## Create cluster with 2 nodes and 2 core cpu for testing autoscaling
gcloud container clusters create guestbook --machine-type=n1-highcpu-2 --num-nodes=2

## Create 2 namespaces staging and production
kubectl apply -f guestbook-namespace.yaml

### Create redis master deployment with their service in both namespace
kubectl apply -f redis-master-deployment.yaml  --namespace=staging
kubectl apply -f redis-master-deployment.yaml  --namespace=production

kubectl apply -f redis-master-service.yaml --namespace=staging
kubectl apply -f redis-master-service.yaml --namespace=production

### Create redis slave deployment with their service in both namespace
kubectl apply -f redis-slave-deployment.yaml --namespace=staging
kubectl apply -f redis-slave-deployment.yaml --namespace=production

kubectl apply -f redis-slave-service.yaml --namespace=staging
kubectl apply -f redis-slave-service.yaml --namespace=production

#### Deploy frontend application with service in both namespace
kubectl apply -f frontend-deployment.yaml --namespace=staging
kubectl apply -f frontend-deployment.yaml --namespace=production

kubectl apply -f frontend-service.yaml --namespace=staging
kubectl apply -f frontend-service.yaml --namespace=production

#### Create nginx ingress controller with static ip which created in above steps
kubectl apply -f guestbook-ingress.yaml 

### Deploy Pods autoscaler for both namespace
kubectl apply -f guestbook-autoscale.yaml --namespace=staging
kubectl apply -f guestbook-autoscale.yaml --namespace=production

