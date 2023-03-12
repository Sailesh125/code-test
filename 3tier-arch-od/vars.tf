variable "vpc_cidr_range" {
  description = "The cidr range for vpc"
  type        = "string"
}

variable "public_subnetRed_cidr" {
  description = "The cidr range for public subnet Red"
  type        = "string"
}

variable "public_subnetGreen_cidr" {
  description = "The cidr range for public subnet Green"
  type        = "string"
}

variable "private_subnetRed_cidr" {
  description = "The cidr range for private subnet Red"
  type        = "string"
}

variable "private_subnetGreen_cidr" {
  description = "The cidr range for private subnet Green"
  type        = "string"
}

variable "db_subnetRed_cidr" {
  description = "The cidr range for db subnet Red"
  type        = "string"
}

variable "db_subnetRed_cidr" {
  description = "The cidr range for db subnet Green"
  type        = "string"
}

variable "username" {
  description = "RDS username"
  type ="string"
}

variable "password" {
  description = "RDS password"
  type ="string"
  sensitive   = true
}

variable "instance_class" {
  description = "RDS instance class"
}

variable "multi_az" {
  description = "Create a replica in different zone if set to true"
}

variable "allocated_storage" {
  description = "The amount of allocated storage"
}