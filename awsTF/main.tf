

provider "aws" {
   
   region     = "ca-central-1"
} 

resource "aws_instance" "example" {
  ami = "ami-0bce70e886ac6890a"
  instance_type = "t2.micro"
tags {
Name = "Env-Test"
}
}



 
