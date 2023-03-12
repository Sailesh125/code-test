variable "db_subnetRed" {
  description = "db_subnetRed"
}

variable "db_subnetGreen" {
  description = "db_subnetGreen"
}

variable "db_security_group" {
  description = "db_security_group"
}

variable "username" {
  description = "RDS username"
}

variable "password" {
  description = "RDS password"
  sensitive   = true
}

variable "instance_class" {
  description = "RDS instance class (e.g. db.t2.micro or db.m4.xlarge)"
}

variable "multi_az" {
  description = "Create a replica in different zone if set to true"
}

variable "allocated_storage" {
  description = "The amount of allocated storage"
}
