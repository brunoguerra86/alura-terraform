terraform{
    backend "remote"{
        hostname = "app.terraform.io"
        organization = "brunoguerralab"

        workspaces {
            name = "aws-brunoguerralab"
        }
    }
}