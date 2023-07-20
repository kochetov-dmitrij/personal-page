terraform {
  backend "remote" {
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
  # Defaults to europe-west3
  region = "nl-ams"
  zone   = "nl-ams-1"
}
