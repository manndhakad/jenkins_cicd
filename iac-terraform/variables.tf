#Variables

variable "ami" {
  description = "AMI ID for the EC2 instance"
  type        = string
  default     = "ami-0144277607031eca2"
}

variable "subnet_id" {
  description = "Subnet ID for the EC2 instance"
  type        = string
  default     = "subnet-025651d626462d9b4"
}

variable "key_name" {
  description = "Key pair name for SSH access"
  type        = string
  default     = "ci_key"
}

variable "vpc_security_group_ids" {
  description = "List of security group IDs"
  type        = list(string)
  default     = ["sg-0ddd90889a334adf5"]
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "env" {
  description = "The environment for the EC2 instance"
  type        = string
  default     = "dev"
}