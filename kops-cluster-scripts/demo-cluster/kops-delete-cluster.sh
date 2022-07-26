#!/bin/bash

CLUSTER_NAME=useast1-demo.apache1clusters.com
KOPS_STATE_STORE=apache-kops-state-bucket

HOSTED_ZONE_ID=$(aws route53 list-hosted-zones-by-name --dns-name ${HOSTED_ZONE_NAME} --query HostedZones[].Id --output text | cut -d/ -f3)
aws route53 delete-hosted-zone --name ${HOSTED_ZONE_ID}


kops delete cluster --yes    \
 --name=${CLUSTER_NAME}      \
 --state=${KOPS_STATE_STORE}

####################################### END OF SCRIPT!!! ##################################### 