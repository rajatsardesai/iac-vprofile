terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "~> 5.16.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "~> 3.5.1"
    }

    tls = {
      source  = "hashicorp/tls"
      version = "~> 4.0.4"
    }

    cloudinit = {
      source  = "hashicorp/cloudinit"
      version = "~> 2.3.2"
    }

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.23.0"
    }
  }

  backend "gcs" {
    bucket = "vprofileactions"
    prefix  = "terraform/state"
  }

  required_version = "~> 1.6.3"
}
##
##
##
