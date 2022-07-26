#!/bin/bash

CLUSTER_NAME=useast1-demo.apacheclusters.com
KOPS_STATE_STORE=apache-kops-state-bucket

kops update cluster --yes     \
 --name=${CLUSTER_NAME}       \                            
 --state=${KOPS_STATE_STORE}                  
    
      
############################################ END OF SCRIPT!!! ################################################