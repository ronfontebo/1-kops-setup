#!/bin/bash

kops delete cluster --yes \
 --name=${CLUSTER_NAME_1} \
 --state=${KOPS_STATE_STORE}

####################################### END OF SCRIPT!!! ##################################### 