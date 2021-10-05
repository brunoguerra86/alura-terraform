variable "amis" {
    type = map

    default = {
        "us-east-1" = "ami-0747bdcabd34c712a"
        "us-east-2" = "ami-00dfe2c7ce89a450b"
    }
}

variable "cidr_acesso_remoto"{
    type = list
    default = ["179.250.171.7/32"]
}

variable "key_name"{
    default = "terraform-aws"
}