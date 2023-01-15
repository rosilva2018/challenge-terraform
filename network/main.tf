/*====
VPC's main
======*/

resource "aws_vpc" "challenge-dev" {
  cidr_block = "${var.cidr_block}"

  tags = {
    Name = "challenge-vpc-dev"
  }
}

/*====
Internet Gateway's gw
======*/

resource "aws_internet_gateway" "challenge-dev-gw" {
  vpc_id = "${aws_vpc.challenge-dev.id}"

  tags = {
    Name = "internet-challenge-dev"
  }
}

/*====
Create Elastic Ip's (EIP)
======*/

resource "aws_eip" "ip_eip" {
  vpc        = true
  depends_on = [aws_internet_gateway.challenge-dev-gw]

  tags = {
    Name = "ip_eip"
  }
}

/*====
Create NAT Gateway's nat
======*/

resource "aws_nat_gateway" "nat" {
  allocation_id = "${aws_eip.ip_eip.id}"
  subnet_id     = "${aws_subnet.public-a-challenge-subnet.id}"
  depends_on    = [aws_internet_gateway.challenge-dev-gw]
}

/*====
Subnet's public
======*/

# Public A
resource "aws_subnet" "public-challenge-subnet" {
  vpc_id            = "${aws_vpc.challenge-dev.id}"
  cidr_block        = "10.0.1.0/24"
  availability_zone = "${var.AWS_REGION}a"

  tags = {
    Name = "publichallenge-subnet"
  }
}

# Public B 

resource "aws_subnet" "public-b-challenge-subnet" {
  vpc_id            = "${aws_vpc.challenge-dev.id}"
  cidr_block        = "10.0.2.0/24"
  availability_zone = "${var.AWS_REGION}b"

  tags = {
    Name = "public-1b-challenge-subnet"
  }
}

# Public C

resource "aws_subnet" "public-c-challenge-subnet" {
  vpc_id            = "${aws_vpc.challenge-dev.id}"
  cidr_block        = "10.0.3.0/24"
  availability_zone = "${var.AWS_REGION}c"

  tags = {
    Name = "public-1c-challenge-subnet"
  }
}

/*====
Subnet's private
======*/

# Private A

resource "aws_subnet" "private-a-challechallenge-subnet" {
  vpc_id            = "${aws_vpc.challechallenge-dev.id}"
  cidr_block        = "10.0.4.0/24"
  availability_zone = "${var.AWS_REGION}a"

  tags = {
    Name = "private-1a-challenge-subnet"
  }
}

# Private B

resource "aws_subnet" "private-b-challechallenge-subnet" {
  vpc_id            = "${aws_vpc.challechallenge-dev.id}"
  cidr_block        = "10.0.5.0/24"
  availability_zone = "${var.AWS_REGION}b"

  tags = {
    Name = "private-1b-challenge-subnet"
  }
}

# Private C 

resource "aws_subnet" "private-c-challechallenge-subnet" {
  vpc_id            = "${aws_vpc.challechallenge-dev.id}"
  cidr_block        = "10.0.6.0/24"
  availability_zone = "${var.AWS_REGION}c"

  tags = {
    Name = "private-1c-challenge-subnet"
  }
}


/*====
Route's table public
======*/

resource "aws_route_table" "challechallenge-public" {
  vpc_id = "${aws_vpc.b39-dev.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.challechallenge-dev-gw.id}"
  }

  tags = {
    Name = "challenge-dev-public"
  }
}

/*====
Route's table private
======*/

# PUBLIC
resource "aws_route_table" "rt-public" {
  vpc_id = "${aws_vpc.challenge-dev.id}"

  route {
    cidr_block     = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.challenge-dev-gw.id}"
  }

  tags = {
    Name = "rt-public"
  }
}

# PRIVATE
resource "aws_route_table" "rt-private" {
  vpc_id = "${aws_vpc.challenge-dev.id}"

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = "${aws_nat_gateway.nat.id}"
  }

  tags = {
    Name = "rt-private"
  }
}

/*====
Route's table association public
======*/

# Public A
resource "aws_route_table_association" "public-a" {
  subnet_id      = "${aws_subnet.public-a-challenge-subnet.id}"
  route_table_id = "${aws_route_table.rt-public.id}"
}

# Public B
resource "aws_route_table_association" "public-b" {
  subnet_id      = "${aws_subnet.public-b-challenge-subnet.id}"
  route_table_id = "${aws_route_table.rt-public.id}"
}

# Public C
resource "aws_route_table_association" "public-c" {
  subnet_id      = "${aws_subnet.public-c-challenge-subnet.id}"
  route_table_id = "${aws_route_table.rt-public.id}"
}

/*====
Route's table association private
======*/

# Private A
resource "aws_route_table_association" "private-a" {
  subnet_id      = "${aws_subnet.private-a-challenge-subnet.id}"
  route_table_id = "${aws_route_table.rt-private.id}"
}

# Private B
resource "aws_route_table_association" "private-b" {
  subnet_id      = "${aws_subnet.private-b-challenge-subnet.id}"
  route_table_id = "${aws_route_table.rt-private.id}"
}

# Private C
resource "aws_route_table_association" "private-c" {
  subnet_id      = "${aws_subnet.private-c-challenge-subnet.id}"
  route_table_id = "${aws_route_table.rt-private.id}"
}
