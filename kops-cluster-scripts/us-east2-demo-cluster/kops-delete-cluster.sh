#!/bin/bash

kops delete cluster --yes \
 --name=${CLUSTER_NAME} \
 --state=${KOPS_STATE_STORE}

####################################### END OF SCRIPT!!! ##################################### 