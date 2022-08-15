resource "aws_vpc" "aws-ops-test" {
  cidr_block = "10.11.0.0/16"
  tags = {
    Name = "aws ops test"
  }
}

resource "aws_subnet" "aws-ops-test-a" {
  vpc_id            = aws_vpc.aws-ops-test.id
  cidr_block        = "10.11.1.0/24"
  availability_zone = "eu-west-2a"
}
resource "aws_subnet" "aws-ops-test-b" {
  vpc_id            = aws_vpc.aws-ops-test.id
  cidr_block        = "10.11.2.0/24"
  availability_zone = "eu-west-2b"
}
resource "aws_subnet" "aws-ops-test-c" {
  vpc_id            = aws_vpc.aws-ops-test.id
  cidr_block        = "10.11.3.0/24"
  availability_zone = "eu-west-2c"
}

resource "aws_security_group" "sg" {
  name = "aws-ops-test-sg"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  vpc_id = aws_vpc.aws-ops-test.id
  tags = {
    Name = "aws-ops-test-sg"
  }
}

module "my_first_instance" {
   source = "./ec2_module"
   #
   #ami = "ami-0e34bbddc66def5ac"
   #instance_type = "t2.micro"
   security_group_ids = [aws_security_group.sg.id]
   subnet_id = aws_subnet.aws-ops-test-a.id  
}

module "my_second_instance" {
   source = "./ec2_module"
#   ami = "ami-0e34bbddc66def5ac"
#   instance_type = "t2.micro"
   security_group_ids = [aws_security_group.sg.id]
   subnet_id = aws_subnet.aws-ops-test-b.id  
}

