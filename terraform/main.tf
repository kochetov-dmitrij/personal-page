terraform {
  cloud {
    organization = "dkochetov"
    workspaces {
      name = "personal-page"
    }
  }

  required_providers {
    scaleway = {
      source = "scaleway/scaleway"
    }
  }

  required_version = "~> 1.5.3"
}

provider "scaleway" {
  access_key      = var.scaleway_access_key
  secret_key      = var.scaleway_secret_key
  organization_id = var.scaleway_organization_id
  project_id      = var.scaleway_project_id
  region = "nl-ams"
  zone   = "nl-ams-1"
}
