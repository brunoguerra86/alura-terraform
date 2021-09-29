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

#Liberação de Security Group para conexão SSH - Alias2
resource "aws_security_group" "acesso-ssh-us-east-2" {
  provider = aws.us-east-2
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