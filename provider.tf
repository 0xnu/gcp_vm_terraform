# Provider connector
provider "google" {
  version     = "~> 3.15"
  project     = var.project
  region      = var.region
  zone        = var.zone
  credentials = file("config/account.json")
}

# force minimal version of terraform cli.
terraform {
  required_version = ">= 0.12.20"
}