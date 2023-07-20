terraform {
  cloud {
    organization = "dkochetov"
    workspaces {
      name = "personal-page"
    }
  }

  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4.10.0"
    }
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.29.0"
    }
  }

  required_version = "~> 1.5.3"
}

provider "cloudflare" {
  api_token = var.cloudflare_api_token
}
provider "digitalocean" {
  token = var.do_token
}
resource "digitalocean_project" "personal_page" {
  name        = "personal-page"
  description = "A project for kochetov.dev personal page"
}
resource "digitalocean_project_resources" "barfoo" {
  project   = digitalocean_project.personal_page.id
  resources = [
    digitalocean_droplet.kochetov-dev.urn
  ]
}
