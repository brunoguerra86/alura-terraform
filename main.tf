provider "aws" {
    region  = "us-east-1"
}

provider "aws" {
    alias = "us-east-2"
    region  = "us-east-2"
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

#Criação de nova instância - EM NOVA REGIÃO
resource "aws_instance" "dev6"{
    provider = aws.us-east-2
    ami = "ami-00dfe2c7ce89a450b" #Amazon Linux 2 AMI (HVM)
    instance_type = "t2.micro"
    key_name = "terraform-aws"
    tags = {
        Name = "dev6"
    }
    vpc_security_group_ids = ["${aws_security_group.acesso-ssh-us-east-2.id}"]
    depends_on = [aws_dynamodb_table.dynamodb-homologacao]
}

#Criação de S3 Bucket
resource "aws_s3_bucket" "dev4" {
  bucket = "labs-dev4"
  acl    = "private"

  tags = {
    Name        = "labs-dev4"
  }
}

#Criando um Banco de Dados
resource "aws_dynamodb_table" "dynamodb-homologacao" {
  provider = aws.us-east-2
  name           = "GameScores"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "UserId"
  range_key      = "GameTitle"

  attribute {
    name = "UserId"
    type = "S"
  }

  attribute {
    name = "GameTitle"
    type = "S"
  } 
}