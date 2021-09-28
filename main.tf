provider "aws" {
    version = "~> 2.0"
    region  = "us-east-1"
}

#Criação de 3 instâncias EC2
resource "aws_instance" "dev"{
    count = 3
    ami = "ami-0747bdcabd34c712a"
    instance_type = "t2.micro"
    key_name = "terraform-aws"
    tags = {
        Name = "dev${count.index}"
    }
    vpc_security_group_ids = ["${aws_security_group.acesso-ssh.id}"]
}

#Criação de nova instância
resource "aws_instance" "dev4"{
    ami = "ami-0747bdcabd34c712a"
    instance_type = "t2.micro"
    key_name = "terraform-aws"
    tags = {
        Name = "dev4"
    }
    vpc_security_group_ids = ["${aws_security_group.acesso-ssh.id}"]
    depends_on = [aws_s3_bucket.dev4]
}

#Criação de nova instância
resource "aws_instance" "dev5"{
    ami = "ami-0747bdcabd34c712a"
    instance_type = "t2.micro"
    key_name = "terraform-aws"
    tags = {
        Name = "dev5"
    }
    vpc_security_group_ids = ["${aws_security_group.acesso-ssh.id}"]
}

#Liberação de Security Group para conexão SSH
resource "aws_security_group" "acesso-ssh" {
  name        = "acesso-ssh"
  description = "acesso-ssh"

  ingress {
      from_port        = 22
      to_port          = 22
      protocol         = "tcp"
      cidr_blocks      = ["179.250.171.7/32"] 
  }
  tags = {
    Name = "ssh"
  }
}

#Criação de S3 Bucket
resource "aws_s3_bucket" "dev4" {
  bucket = "labs-dev4"
  acl    = "private"

  tags = {
    Name        = "labs-dev4"
  }
}