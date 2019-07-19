# K8s-Level1
Install gcloud SDK and initilize with account login
gcloud init

Set Project name where we will setup all of our Clustering

wrapper.sh script is used to deploy backend & frontend & ingress & autoscale

cpu-load.txt Describe the steps to increase load on application for testing autoscaling

### Steps to check horizontal pod autoscaling status
kubectl get hpa --namespace=staging  

######################################
-> i have select n1-highcpu-2 (2 core cpu 1.8 G RAM) with 2 nodes so total there are 4 core cpus. That i have used basically for testing autoscaling. We can take 1 nodes and configure veritcal autoscaling as well

-> Use Docker images of Demo application to deploy in cluster using kubernets command (kubectl)

-> Google Cloud monitoring tool can use to visualize and alert an important metrics in our application.
