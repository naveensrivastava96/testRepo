
variable "aws_access_key" {}
variable "aws_secret_key" {}
 
provider "aws" {
    access_key = "${var.aws_access_key}"
   secret_key = "${var.aws_secret_key}"
   region     = "ca-central-1"
} 

resource "aws_instance" "example" {
  ami = "ami-0bce70e886ac6890a"
  instance_type = "t2.micro"
tags {
Name = "Env-Test"
}
}



 
