variable "public_subnetRed" {
  description = "The public subnet Red id"
  type        = "string"
}

variable "public_subnetGreen" {
  description = "The public subnet Green id"
  type        = "string"
}

variable "private_subnetRed" {
  description = "The private subnet Red id"
  type        = "string"
}

variable "private_subnetGreen" {
  description = "The private subnet Green id"
  type        = "string"
}

variable "public_sg" {
  description = "The public security group id"
  type        = "string"
}

variable "private_sg" {
  description = "The private security group id"
  type        = "string"
}
