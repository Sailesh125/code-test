output "main_vpc" {
  description = "vpc id"
  value       = "${aws_vpc.od_vpc.id}"
}

output "public_subnetRed" {
  description = "The public subnet Red id"
  value       = "${aws_subnet.public_subnetRed.id}"
}

output "public_subnetGreen" {
  description = "The public subnet Green id"
  value       = "${aws_subnet.public_subnetGreen.id}"
}

output "private_subnetRed" {
  description = "The private subnet Red id"
  value       = "${aws_subnet.private_subnetRed.id}"
}

output "private_subnetGreen" {
  description = "The private subnet Green id"
  value       = "${aws_subnet.private_subnetGreen.id}"
}

output "db_subnetRed" {
  description = "The db subnet Red id"
  value       = "${aws_subnet.db_subnetRed.id}"
}

output "db_subnetGreen" {
  description = "The db subnet Green id"
  value       = "${aws_subnet.db_subnetGreen.id}"
}

output "public_sg" {
  description = "The public security group id"
  value       = "${aws_security_group.public_sg.id}"
}

output "private_sg" {
  description = "The private security group id"
  value       = "${aws_security_group.private_sg.id}"
}
