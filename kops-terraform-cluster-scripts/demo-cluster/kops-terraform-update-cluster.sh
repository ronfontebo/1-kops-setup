# Shell script to update a k8s cluster using kops and terraform
#==============================================================
# To create a cluster, copy this file to your kops-vm and edit it with your custom values for the variables.
# Save the changes and exit.
# Update the cluster by running the script with: 
#   ===> sh kops-terraform-update-cluster.sh 
#=============================================================================================================


#!/bin/bash

kops create cluster                         \
 --name=${CLUSTER_NAME}                     \
 --state=${KOPS_STATE_STORE}                \     
 --out=.                                    \      
 --target=terraform 


# terraform file will be generated

# if you wish add additional files in the terraform directory then you will need to:
# - comment out the below teraform commands
# - add the additional configuration files, then
# - run terraform apply -auto-approve


terraform apply -auto-approve
      
############################################ END OF SCRIPT!!! ################################################ 