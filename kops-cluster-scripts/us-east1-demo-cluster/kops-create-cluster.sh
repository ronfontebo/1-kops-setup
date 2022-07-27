#!/bin/bash

CLUSTER_NAME=useast1-demo.apache1clusters.com
KOPS_STATE_STORE=apache-kops-state-bucket
AVAILABILITY_ZONE=us-east-1a,us-east-1b,us-east-1c
MASTER_INSTANCE_TYPE=t2.micro
WORKER_INSTANCE_TYPE=t2.micro
NODE_COUNT=1
HOSTED_ZONE_NAME=apache1clusters.com
PUBLIC_KEY=kops-key.pem.pub
#OUT_DIRECTORY=/home/ubuntu


TIME=`date +%H:%M,%a-%b-%d-%y`

aws route53 create-hosted-zone \
 --name ${HOSTED_ZONE_NAME} \
 --caller-reference ${TIME} | jq .DelegationSet.NameServers



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