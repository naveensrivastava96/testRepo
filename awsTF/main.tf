

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

provider "docker" {
  host = "http://10.243.41.201:4243"
}

resource "docker_container" "ca-sample" {
  name  = "${random_string.random_name.result}"
  image = "${docker_image.dummy_image.latest}"
  entrypoint = ["/bin/sleep"]
  command = [ "1d" ]
}

resource "docker_image" "dummy_image" {
  name = "busybox:latest"
}

resource "random_string" "random_name" {
	length  = 5
	special = false
	lower   = false
}


 
