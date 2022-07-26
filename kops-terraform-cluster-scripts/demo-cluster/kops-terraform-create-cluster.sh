# Shell script to create a k8s cluster using kops and terraform
#==============================================================
# To create a cluster, copy this file to your kops-vm and edit it with your custom values for the variables.
# Save the changes and exit.
# Create the cluster by running the script with: 
#   ===> sh kops-terraform-create-cluster.sh 
#=============================================================================================================


#!/bin/bash

kops create cluster                         \
 --name=${CLUSTER_NAME}                     \
 --cloud=aws                                \     
 --state=${KOPS_STATE_STORE}                \     
 --zones=${AVAILABILITY_ZONE}               \      
 --master-size="${MASTER_INSTANCE_TYPE}"    \      
 --node-size="${WORKER_INSTANCE_TYPE}"      \
 --node-count="${NODE_COUNT}"               \
 --dns-zone="${DNS_ZONE_NAME}"              \  
 --dns public                               \     
 --ssh-public-key="${/PATH/TO/PUBLIC_KEY}"  \      
 --out=.                                    \      
 --target=terraform 


# a terraform file will be generated

# if you wish add additional files in the terraform directory then you will need to:
# - comment out the below teraform commands
# - add the additional configuration files, then
# - run terraform init and
# - run terraform apply -auto-approve

terraform init
terraform apply -auto-approve
      
############################################ END OF SCRIPT!!! ################################################       