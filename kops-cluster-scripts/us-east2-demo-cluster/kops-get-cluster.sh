#!/bin/bash

kops get cluster \
 --name=${CLUSTER_NAME} \
 --state=${KOPS_STATE_STORE}

#################################### END OF SCRIPT!!! ####################################