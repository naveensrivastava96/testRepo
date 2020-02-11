
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
