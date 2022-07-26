
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
  region  = "${var.region}"
}


resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}


resource "aws_instance" "server" {
  ami                  = "${var.server_ami}"
  key_name             = "${var.server_key_pair}" 
  instance_type        = "${var.server_instance_type}"
  iam_instance_profile = "${aws_iam_instance_profile.server_profile.name}"  
  security_groups      = ["${aws_security_group.server_sg.name}"]
  user_data            = file("${var.user_data_file}")

/*
# Download kops-cluster-scripts from github repository to /home/ubuntu 
#*********************************************************************
  provisioner "remote-exec" {
    inline = [
      "git clone ${var.kops_setup_git_url}",
      "mv 1-kops-setup/kops-cluster-scripts/demo-cluster /home/ubuntu",
      "rm -rf 1-kops-setup",
    ]

    connection {
      type        = "ssh"
      user        = "${var.server_default_user}"              
      #private_key = "${file("${var.local_key_pair}")}"  
      private_key = "${file("~/Downloads/california-key-pair.pem")}" 
      host        = "${self.public_dns}"
    }
  }
*/
  tags = {
    Name = "${var.server_name}"     
    OS   = "${var.server_os}"    
    Env  = "${var.server_env}"   
  }
}


resource "aws_iam_instance_profile" "server_profile" {
  name = "${var.server_name}-instance-profile"
  role = "${aws_iam_role.server_role.name}"     # not .id???????

  tags = {
    Name = "${var.server_name}-instance-profile"
  }
}


resource "aws_security_group" "server_sg" {
  name   = "${var.server_name}-sg"
  vpc_id = "${aws_default_vpc.default.id}"

  ingress {
    description  = "allow inbound ssh access"
    from_port    = 22
    to_port      = 22
    protocol     = "tcp"
    cidr_blocks  = ["${var.admin_ssh_access_ip}"]
  }

  egress {
    description = "allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]        # set to private ip in production environment
  }

  tags = {
    Name = "${var.server_name}-sg"
  }
}

####################################### END OF SCRIPT !!! #########################################