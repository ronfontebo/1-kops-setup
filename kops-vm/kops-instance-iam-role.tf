# Terraform configuration file for provisioning the kops-vm iam role
#===================================================================
# This role will give the kops-vm the required permiisions to create k8s clusters in an aws account.
#===================================================================================================
# Steps:
#=======
# Create iam role (+ assume role policy)
# Create iam role policy with the following iam permissions:
#   - AmazonS3FullAccess 
#   - AmazonEC2FullAccess 
#   - AmazonRoute53FullAccess 
#   - IAMFullAccess 
#   - AmazonVPCFullAccess 
#=============================================================================================================


resource "aws_iam_role" "server_role" {
  name               = "${var.server_name}-iam-role"
  assume_role_policy = "${data.aws_iam_policy_document.server_assume_role.json}"

  tags = {
    Name = "${var.server_name}-iam-role"
  }
}


data "aws_iam_policy_document" "server_assume_role" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
    effect = "Allow"
  }
}


resource "aws_iam_role_policy" "server_role_policy" {
  name   = "${var.server_name}-iam-role-policy"
  role   = "${aws_iam_role.server_role.id}"
  policy = "${data.aws_iam_policy_document.server_role_policy.json}"
}


data "aws_iam_policy_document" "server_role_policy" {
  statement {
    actions = [
      "ec2:*", 
      "s3:*",
      "route53:*",
      "iam:*",
      "vpc:*",
    ]
  
    effect = "Allow"

    resources = [
      "arn:aws:ec2:::*",
      "arn:aws:s3:::*",
      "arn:aws:route53:::*",
      "arn:aws:iam:::*",
      "arn:aws:vpc:::*",
    ]
  }
}

####################################### END OF SCRIPT !!! #######################################