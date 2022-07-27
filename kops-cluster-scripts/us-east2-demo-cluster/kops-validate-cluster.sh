#!/bin/bash

CLUSTER_NAME=useast2-demo-cluster.apacheplayground.com
KOPS_STATE_STORE=s3://apache-kops-state-bucket

kops validate cluster \
 --name=${CLUSTER_NAME} \                            
 --state=${KOPS_STATE_STORE}                  
    
      
###################################### END OF SCRIPT!!! #######################################