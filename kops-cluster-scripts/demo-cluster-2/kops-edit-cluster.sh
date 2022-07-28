#!/bin/bash

CLUSTER_NAME=useast1-demo.apache1clusters.com
KOPS_STATE_STORE=apache-kops-state-bucket

kops edit cluster            \
 --name=${CLUSTER_NAME}      \
 --state=${KOPS_STATE_STORE} 

############################################ END OF SCRIPT!!! ################################################


