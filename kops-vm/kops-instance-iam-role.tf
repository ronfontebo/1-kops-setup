
# Create iam role policy with the following aws managed iam policies:
#   - AmazonS3FullAccess 
#   - AmazonEC2FullAccess 
#   - AmazonRoute53FullAccess 
#   - IAMFullAccess 
#   - AmazonVPCFullAccess 
#   - AmazonSQSFullAccess
#   - AmazonEventBridgeFullAccess
#===============================================================================


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


data "aws_iam_policy" "AmazonEC2FullAccess" {
  arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
}

data "aws_iam_policy" "AmazonRoute53FullAccess" {
  arn = "arn:aws:iam::aws:policy/AmazonRoute53FullAccess"
}

data "aws_iam_policy" "AmazonS3FullAccess" {
  arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}

data "aws_iam_policy" "IAMFullAccess" {
  arn = "arn:aws:iam::aws:policy/IAMFullAccess"
}

data "aws_iam_policy" "AmazonVPCFullAccess" {
  arn = "arn:aws:iam::aws:policy/AmazonVPCFullAccess"
}

data "aws_iam_policy" "AmazonSQSFullAccess" {
  arn = "arn:aws:iam::aws:policy/AmazonSQSFullAccess"
}

data "aws_iam_policy" "AmazonEventBridgeFullAccess" {
  arn = "arn:aws:iam::aws:policy/AmazonEventBridgeFullAccess"
}

/*
 *** all of the users/roles/groups to which a single policy is attached must be declared by 
     a single aws_iam_policy_attachment resource ****
*/

resource "aws_iam_role_policy_attachment" "server_role_policy_attachment1" {
  role       = "${aws_iam_role.server_role.id}"
  policy_arn = "${data.aws_iam_policy.AmazonEC2FullAccess.arn}"
}

resource "aws_iam_role_policy_attachment" "server_role_policy_attachment2" {
  role       = "${aws_iam_role.server_role.id}"
  policy_arn = "${data.aws_iam_policy.AmazonRoute53FullAccess.arn}"
}

resource "aws_iam_role_policy_attachment" "server_role_policy_attachment3" {
  role       = "${aws_iam_role.server_role.id}"
  policy_arn = "${data.aws_iam_policy.AmazonS3FullAccess.arn}"
}

resource "aws_iam_role_policy_attachment" "server_role_policy_attachment4" {
  role       = "${aws_iam_role.server_role.id}"
  policy_arn = "${data.aws_iam_policy.IAMFullAccess.arn}"
}

resource "aws_iam_role_policy_attachment" "server_role_policy_attachment5" {
  role       = "${aws_iam_role.server_role.id}"
  policy_arn = "${data.aws_iam_policy.AmazonVPCFullAccess.arn}"
}

resource "aws_iam_role_policy_attachment" "server_role_policy_attachment6" {
  role       = "${aws_iam_role.server_role.id}"
  policy_arn = "${data.aws_iam_policy.AmazonSQSFullAccess.arn}"
}

resource "aws_iam_role_policy_attachment" "server_role_policy_attachment7" {
  role       = "${aws_iam_role.server_role.id}"
  policy_arn = "${data.aws_iam_policy.AmazonEventBridgeFullAccess.arn}"
}

####################################### END OF SCRIPT !!! #######################################