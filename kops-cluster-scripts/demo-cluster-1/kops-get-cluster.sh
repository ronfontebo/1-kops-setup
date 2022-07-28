#!/bin/bash

kops get cluster \
 --name=${CLUSTER_NAME_1} \
 --state=${KOPS_STATE_STORE}

#################################### END OF SCRIPT!!! ####################################