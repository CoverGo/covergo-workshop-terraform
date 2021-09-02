// ---------------------------------------
// This example will simply start an ec2 instance and
// provide you with the ip of the instance
// ---------------------------------------

provider "aws" {
  region = "ap-southeast-1"
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "ec2" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  tags = {
    Name = "example1Covergo"
    Nuke = true
  }
}
