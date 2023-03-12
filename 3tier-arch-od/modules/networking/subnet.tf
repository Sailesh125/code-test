/* File to create Public , private subnet and their subsequent route tables*/

#public subnet 

resource "aws_subnet" "public_subnetRed" {
  vpc_id                  = "${aws_vpc.od_vpc.id}"
  cidr_block              = "${var.public_subnetRed_cidr}"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags {
    Name = "public-subnetRed"
  }
}

resource "aws_subnet" "public_subnetGreen" {
  vpc_id                  = "${aws_vpc.main_vpc.id}"
  cidr_block              = "${var.public_subnetGreen_cidr}"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true

  tags {
    Name = "public-subnetGreen"
  }
}

#Public Route Table

resource "aws_route_table" "public_route_table" {
  vpc_id = "${aws_vpc.od_vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.od_igw.id}"
  }

  tags {
    Name = "public-route-table"
  }
}

resource "aws_route_table_association" "public_Red" {
  subnet_id      = "${aws_subnet.public_subnetRed.id}"
  route_table_id = "${aws_route_table.public_route_table.id}"
}

resource "aws_route_table_association" "public_Green" {
  subnet_id      = "${aws_subnet.public_subnetGreen.id}"
  route_table_id = "${aws_route_table.public_route_table.id}"
}

#Private Subnet (Including databse subnet)

resource "aws_subnet" "private_subnetRed" {
  vpc_id                  = "${aws_vpc.od_vpc.id}"
  cidr_block              = "${var.private_subnetRed_cidr}"
  availability_zone       = "us-east-1a"

  tags {
    Name = "private-subnetRed"
  }
}

resource "aws_subnet" "private_subnetGreen" {
  vpc_id                  = "${aws_vpc.od_vpc.id}"
  cidr_block              = "${var.private_subnetGreen_cidr}"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = false

  tags {
    Name = "private-subnetGreen"
  }
}

resource "aws_subnet" "db_subnetRed" {
  vpc_id                  = "${aws_vpc.od_vpc.id}"
  cidr_block              = "${var.db_subnetRed_cidr}"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = false
  tags {
    Name = "db_subnetRed"
  }
}

resource "aws_subnet" "db_subnetGreen" {
  vpc_id                  = "${aws_vpc.od_vpc.id}"
  cidr_block              = "${var.db_subnetGreen_cidr}"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = false

  tags {
    Name = "db_subnetGreen"
  }
}

#Private route tables

resource "aws_route_table" "private_route_table_Red" {
  vpc_id = "${aws_vpc.od_vpc.id}"

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = "${aws_nat_gateway.nat_gw_Red.id}"
  }

  tags {
    Name = "private-route-table-red"
  }
}

resource "aws_route_table_association" "private_Red" {
  subnet_id      = "${aws_subnet.private_subnetRed.id}"
  route_table_id = "${aws_route_table.private_route_table_Red.id}"
}

resource "aws_route_table" "private_route_table_Green" {
  vpc_id = "${aws_vpc.od_vpc.id}"

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = "${aws_nat_gateway.nat_gw_Green.id}"
  }

  tags {
    Name = "private-route-table-Green"
  }
}

resource "aws_route_table_association" "private_Green" {
  subnet_id      = "${aws_subnet.private_subnetRed.id}"
  route_table_id = "${aws_route_table.private_route_table_Green.id}"
}