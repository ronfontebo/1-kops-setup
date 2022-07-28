#!/bin/bash

kops update cluster --yes \
 --name=${CLUSTER_NAME_1} \                            
 --state=${KOPS_STATE_STORE}                  
    
      
#################################### END OF SCRIPT!!! ######################################