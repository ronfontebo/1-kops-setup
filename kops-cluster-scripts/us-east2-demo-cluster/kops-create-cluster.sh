#!/bin/bash

CLUSTER_NAME=useast2-demo-cluster.apacheplayground.com
KOPS_STATE_STORE=s3://apache-kops-state-bucket
AVAILABILITY_ZONE=us-east-2a,us-east-2b,us-east-2c
MASTER_INSTANCE_TYPE=t2.micro
WORKER_INSTANCE_TYPE=t2.micro
NODE_COUNT=3
HOSTED_ZONE_NAME=apacheplayground.com
PUBLIC_KEY=kops-key.pem.pub
#OUT_DIRECTORY=/home/ubuntu


kops create cluster --yes \
 --name=${CLUSTER_NAME} \
 --cloud=aws \
 --state=${KOPS_STATE_STORE} \
 --zones=${AVAILABILITY_ZONE} \
 --master-size="${MASTER_INSTANCE_TYPE}" \
 --node-size="${WORKER_INSTANCE_TYPE}" \
 --node-count="${NODE_COUNT}" \
 --dns-zone="${DNS_ZONE_NAME}" \
 --dns public \
 --ssh-public-key="${PUBLIC_KEY}" 
# --out=${OUT_DIRECTORY} \
# --target=terraform

#terraform init
#terraform apply -auto-approve    
      
############################################ END OF SCRIPT!!! ################################################