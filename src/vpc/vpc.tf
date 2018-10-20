#
# VPC Resources
#  * VPC
#  * Subnets
#  * Internet Gateway
#  * Route Table
#
resource "aws_vpc" "vpc" {
  cidr_block = "${var.vpc_cidr_block}"
  tags = "${
    map(
     "Name", "${var.vpc_network_name}",
     "kubernetes.io/cluster/${var.eks_cluster_name}", "shared",
    )
  }"
}

resource "aws_subnet" "vpc" {
  count = 2

  availability_zone = "${data.aws_availability_zones.available.names[count.index]}"
  cidr_block        = "${replace(var.vpc_subnet_cidr_block, "COUNT_INDEX", count.index)}"

  vpc_id            = "${aws_vpc.vpc.id}"

  tags = "${
    map(
     "Name", "${var.vpc_network_name}",
     "kubernetes.io/cluster/${var.eks_cluster_name}", "shared",
    )
  }"
}

resource "aws_internet_gateway" "vpc" {
  vpc_id = "${aws_vpc.vpc.id}"

  tags {
    Name = "${var.vpc_network_name}"
  }
}

resource "aws_route_table" "vpc" {
  vpc_id = "${aws_vpc.vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.vpc.id}"
  }
}

resource "aws_route_table_association" "vpc" {
  count = 2

  subnet_id      = "${aws_subnet.vpc.*.id[count.index]}"
  route_table_id = "${aws_route_table.vpc.id}"
}
