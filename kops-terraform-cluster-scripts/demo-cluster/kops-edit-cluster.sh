# Shell script to edit a k8s cluster
#===================================
# To edit a cluster, copy this file to your kops-vm and edit it with your custom values for the variables.
# Save the changes and exit.
# Run the script with: 
#   ===> sh kops-edit-cluster.sh 
# Running this script will open your cluster config file in the default editor e.g vi, where you will be able
# to make changes to your cluster.
# Save the changes and exit the editor.
# To apply the changes 2 have 2 options:
#   - Run the kops-update-cluster.sh script (with --yes argument) to update directly with kops 
#      OR
#   - Run the kops-terraform-update-cluster.sh script, to update the via terraform
#=============================================================================================================


#!/bin/bash

kops edit cluster            \
 --name=${CLUSTER_NAME}      \
 --state=${KOPS_STATE_STORE} 

############################################ END OF SCRIPT!!! ################################################


