variable "vpc_cidr" {
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

variable "db_subnetGreen_cidr" {
  description = "The cidr range for db subnet Green"
  type        = "string"
}
