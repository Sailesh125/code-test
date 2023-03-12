/*configuration of VPC and internet gateway */

resource "aws_vpc" "od_vpc" {
  cidr_block           = "${var.vpc_cidr}"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags {
    Name = "od-vpc"
  }
}
resource "aws_internet_gateway" "od_igw" {
  vpc_id = "${aws_vpc.od_vpc.id}"

  tags {
    Name = "od_igw"
  }
}
