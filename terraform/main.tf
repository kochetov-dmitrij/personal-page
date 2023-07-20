terraform {
  cloud {
    organization = "dkochetov"
    workspaces {
      name = "personal-page"
    }
  }

  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "~> 2.29.0"
    }
  }

  required_version = "~> 1.5.3"
}

provider "digitalocean" {
  token = var.do_token
}

resource "digitalocean_project" "personal_page" {
  name        = "personal-page"
  description = "A project for kochetov.dev personal page"
}
