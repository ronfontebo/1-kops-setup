# Terraform configuration file for provisioning a kops-cluster-state-s3-bucket 
# for clusters that will be created using the kops-vm ec2 instance
#=============================================================================
# ****** Multiple clusters can use the same S3 bucket ******
#===============================================================================
# Steps:
#=======
# Create a private s3 bucket
# Create private acl for bucket
# Enable bucket versioning to allow for state recovery in the case of accidental deletions and human error.
# Create bucket policy with the following iam permissions:
#   - s3:ListBucket   (bucket-level permission)
#   - s3:PutObject    (object-level permission)
#   - s3:GetObject    (object-level permission)
#   - s3:DeleteObject (object-level permission)
#
# **** We recommend keeping the creation of this bucket confined to us-east-1, otherwise more work will be 
#      required.
#------------------------------------------------------------------------------------------------------------


#*******************************************************************************************************
# Configure terraform provider as aws  # add an s3 backend for state storage  ***advanced
#*******************************************************************************************************
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.9.0"
    }
  }
}

provider "aws" {
  profile = "default"
  region  = "us-east-1"
}


#*************************************************************************************************************
# 1. Create s3 bucket
#*************************************************************************************************************
resource "aws_s3_bucket" "kops" {
  bucket = "apache-kops-state-bucket"
  #acl   = "private"  (deprecated)

  tags = {
    Name = "apache-kops-state-bucket"
  }
}


#*************************************************************************************************************
# 2. Create private acl for bucket
#*************************************************************************************************************
resource "aws_s3_bucket_acl" "kops" {
  bucket = "${aws_s3_bucket.kops.id}"
  acl    = "private"
}


#************************************************************************************************************
# 3. Enable bucket versioning 
#************************************************************************************************************
resource "aws_s3_bucket_versioning" "kops" {
  bucket = "${aws_s3_bucket.kops.id}"
  versioning_configuration {
    status = "Enabled"
  }
}


#*************************************************************************************************************
# 4. Create bucket policy
#*************************************************************************************************************
resource "aws_s3_bucket_policy" "kops" {
  bucket = "${aws_s3_bucket.kops.id}"
  policy = "${data.aws_iam_policy_document.kops_bucket.json}"
}

#*****************************************************************

data "aws_iam_policy_document" "kops_bucket" {
  statement {
    effect = "Allow"

    principals {
      type        = "AWS"
      identifiers = ["*"]
    }

    actions   = [
      "s3:ListBucket",
      "s3:PutObject",
      "s3:GetObject",
      "s3:DeleteObject",
    ]

    resources = [
      "${aws_s3_bucket.kops.arn}",
      "${aws_s3_bucket.kops.arn}/*",
    ] 
  }
}


########################################### END OF SCRIPT !!! ################################################