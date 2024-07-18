variable "tags" {
  description = "Tags used for all resources"
  type        = map(string)
  default     = {}
}

variable "instance_ami" {
  description = "The AMI to use for the instance"
  type        = string
  default     = "ami-04b70fa74e45c3917"
}

variable "instance_type" {
  description = "The type of instance to start"
  type        = string
  default     = "t2.micro"
}

variable "subnet_id" {
  description = "The subnet ID to launch the instance in"
  type        = string
}

variable "github_token" {
  description = "github token"
  type        = string
}

variable "github_url" {
  description = "github url"
  type        = string
}

variable "github_name" {
  description = "github name"
  type        = string
}

variable "github_labels" {
  description = "github labels"
  type        = string
}

variable "github_file" {
  description = "github file"
  type        = string
  default     = "actions-runner-linux-x64-2.317.0.tar.gz"
}

variable "github_version" {
    description = "github version"
    type        = string
    default = "v2.317.0"
}

variable "github_code" {
  description = "github code"
  type        = string
}

variable "vpc_id" {
  description = "The VPC ID to launch the sg in"
  type        = string
}

variable "security_group_name" {
  description = "The name of the security group to create"
  type        = string
  default     = "runner_sg"
}

variable "ec2_key_id" {
    description = "The key pair to use for the instance"
    type        = string
}