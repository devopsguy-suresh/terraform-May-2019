resource "aws_vpc" "myvpc" {
  cidr_block = "${var.vpc_cidr}"

  tags {
    Name = "${var.vpc_name}"
  }
}

resource "aws_subnet" "mysubnet1" {
  count             = "${length(var.subnet_cidr1)}"
  vpc_id            = "${aws_vpc.myvpc.id}"
  cidr_block        = "${element(var.subnet_cidr1,count.index)}"
  availability_zone = "${element(var.azs,count.index)}"

  tags {
    Name = "TerraformSubnet-${count.index + 1}"
  }
}

resource "aws_route_table" "rt" {
  vpc_id = "${aws_vpc.myvpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.igw.id}"
  }

  tags {
    Name = "${var.rt_name}"
  }
}

resource "aws_route_table_association" "rt-assoiation" {
  count          = "${length(var.subnet_cidr1)}"
  subnet_id      = "${aws_subnet.mysubnet1.*.id[count.index]}"
  route_table_id = "${aws_route_table.rt.id}"
}

resource "aws_internet_gateway" "igw" {
  vpc_id = "${aws_vpc.myvpc.id}"

  tags {
    Name = "Terraform-IGW"
  }
}
