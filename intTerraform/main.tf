variable "aws_access_key" {}
variable "aws_secret_key" {}

provider "aws" {
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region = "us-east-1"
  
}

resource "aws_vpc" "test-vpc" {
  cidr_block           = "172.28.0.0/16"
  enable_dns_hostnames = "true"
 
  tags = {
    "Name" : "Deployment4VPC"
  }
}

resource "aws_subnet" "public1" {
  cidr_block = "172.28.0.0/18"
  vpc_id                  = aws_vpc.test-vpc.id
  map_public_ip_on_launch = "true"
  availability_zone       = data.aws_availability_zones.available.names[0]
}

resource "aws_instance" "web_server01" {
  ami = "ami-08c40ec9ead489470"
  instance_type = "t2.micro"
  key_name = "ssh1"
  vpc_security_group_ids = [aws_security_group.web_ssh.id]
  subnet_id = aws_subnet.public1.id  

  user_data = "${file("deploy.sh")}"

  tags = {
    "Name" : "Webserver001"
  }
  
}

data "aws_availability_zones" "available" {
  state = "available"
}


output "instance_ip" {
  value = aws_instance.web_server01.public_ip
  
}
