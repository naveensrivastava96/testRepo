

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


provider "cda" {
	cda_server = "${var.cda_server}"
	user       = "${var.cda_user}"
	password   = "${var.cda_password}"
  default_attributes = {
		folder = "DEMOAPP"
		owner = "200/AUTOMIC/AUTOMIC"		
  }
}

resource "random_integer" "name_extension" {
  min     = 1
  max     = 99999
}

#resource "cda_deployment_profile" "myProfile" {
#  name  = "my_profile_${random_integer.name_extension.result}"
#  application  = "DemoApp"
#  login_object = "Login.All"
#  environment  = "Local"
#  description = "My Profile"
#   deployment_map = {
#   "database" = "${cda_deployment_target.myTarget1.name}",
#   "webapp" = "${cda_deployment_target.myTarget2.name}"
#  } 
#}

#resource "cda_workflow_execution" "my_execution" {
#  triggers = "true" 
#  application                  = "DemoApp" 
#  workflow                     = "Deploy" 
#  package                      = "1" 
#  deployment_profile           = "my_profile_${random_integer.name_extension.result}" 
#  manual_approval              = "true" 
#  approver                     = "${var.user}"
#  schedule                     = "2019-12-28T13:44:00Z" //"cron(0 3 12 12 ? 2019)" //start_date = "2019-12-12" //start_time = "3:00"  
#  override_existing_components = "true"
#  depends_on = [
#  	cda_deployment_profile.myProfile    
#    ]  
#}

variable "cda_server" {
  default = "http://10.108.54.205:8080/awi"
}

variable "cda_user" {
  default = "400/AUTOMIC/AUTOMIC"
}

variable "cda_password" {
	default = "test"
}

 
