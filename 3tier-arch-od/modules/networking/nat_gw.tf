#Creation of Natgateway in different AZs to provide internet connectivity to the private resources 

resource "aws_eip" "eip_Red" {
  vpc        = true
  depends_on = ["aws_internet_gateway.od_igw"]
}

resource "aws_nat_gateway" "nat_gw_Red" {
  allocation_id = "${aws_eip.eip_Red.id}"
  subnet_id     = "${aws_subnet.public_subnetRed.id}"
  depends_on    = ["aws_internet_gateway.od_igw"]
}

resource "aws_eip" "eip_Green" {
  vpc        = true
  depends_on = ["aws_internet_gateway.od_igw"]
}

resource "aws_nat_gateway" "nat_gw_Green" {
  allocation_id = "${aws_eip.nat_eip_y.id}"
  subnet_id     = "${aws_subnet.public_subnetGreen.id}"
  depends_on    = ["aws_internet_gateway.od_igw"]
}