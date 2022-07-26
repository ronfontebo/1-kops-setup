
variable "region" {
  type = string
}

variable "server_ami" {
  type = string
}

variable "server_key_pair" {
  type = string
}

variable "server_instance_type" {
  type = string
}

variable "user_data_file" {
  type = string
}

variable "server_name" {
  type = string
}

variable "server_os" {
  type = string
}

variable "server_env" {
  type = string
}

variable "admin_ssh_access_ip" {
  type = string
}

variable "kops_setup_git_url" {
  type = string
}

variable "server_default_user" {
  type = string
}

variable "local_key_pair" {
  type = string
}
   
################################## END OF SCRIPT !!! ###################################