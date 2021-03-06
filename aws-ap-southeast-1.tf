provider "aws" {
  alias = "ap-southeast-1"
  region = "ap-southeast-1"
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}" 
}

resource "aws_security_group" "ap-southeast-1" {

    name = "terraform_security_group"
    description = "AWS security group for terraform example"

    provider = "aws.ap-southeast-1"

    ingress {
        from_port       = 0
        to_port         = 0
        protocol        = "-1"
        cidr_blocks     = ["0.0.0.0/0"]
    }

    egress {
        from_port       = 0
        to_port         = 0
        protocol        = "-1"
        cidr_blocks     = ["0.0.0.0/0"]
    }

}