# Shell script to delete a k8s cluster using kops and terraform
#==============================================================
# To create a cluster, copy this file to your kops-vm and edit it with your custom values for the variables.
# Save the changes and exit.
# Update the cluster by running the script with: 
#   ===> sh kops-terraform-delete-cluster.sh 
# When a cluster is created using kops and terraform, its deletion process is 2-phased:
#  - First with terraform and then
#  - Second with kops
#=============================================================================================================


#!/bin/bash

terraform destroy -auto-approve   #-auto-approve  ????

kops delete cluster --yes    \
 --name=${CLUSTER_NAME}      \
 --state=${KOPS_STATE_STORE}

############################################ END OF SCRIPT!!! ################################################ 