

variable "aws_access_key" { default="asddad" }
variable "aws_secret_key" {default="asdfasdfas"}
 
provider "aws" {
    access_key = "${var.aws_access_key}"
   secret_key = "${var.aws_secret_key}"
   region     = "ca-central-1"
} 

resource "aws_instance" "example" {
  ami = "ami-0bce70e886ac6890a"
  instance_type = "t2.micro"
tags {
Name = "Demo-ENV"
}
}

variable "github_token" {}

provider "github" {
    #create account and get token
    token = "${var.github_token}"
  organization = "testing-for-terraform"
}

resource "github_repository" "sample-terraform-app" {
    name = "sample-terraform-app-1"
    description = "Sample terraform app demo"
    auto_init = true # initial commit provision
}
