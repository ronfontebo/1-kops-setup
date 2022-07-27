#!/bin/bash

CLUSTER_NAME=useast2-demo-cluster.apacheplayground.com
KOPS_STATE_STORE=apache-kops-state-bucket

kops edit cluster            \
 --name=${CLUSTER_NAME}      \
 --state=${KOPS_STATE_STORE} 

############################################ END OF SCRIPT!!! ################################################

