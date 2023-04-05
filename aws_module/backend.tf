terraform {
backend "remote" { 
    hostname     = "app.terraform.io"
    organization = "devopsbc"
    workspaces {
      name = "devopsbc"
    }
  }
}