provider "kubernetes" {
  host                   = module.gke.endpoint
  token                  = data.google_client_config.default.access_token
  cluster_ca_certificate = base64decode(module.gke.ca_certificate)
}

data "google_client_config" "default" {}

locals {
  cluster_name = var.clusterName
}

resource "google_compute_router" "router" {
  name    = "vprofile-gke-router"
  region  = var.region

  bgp {
    asn = 64514
  }
}

resource "google_compute_router_nat" "nat_manual" {
  name   = "vprofile-gke-nat"
  router = "vprofile-gke-router"
  region = var.region

  nat_ip_allocate_option = "AUTO_ONLY"

  source_subnetwork_ip_ranges_to_nat = ["public-subnet-2"]
  subnetwork {
    name                    = "public-subnet-2"
    source_ip_ranges_to_nat = ["172.16.2.0/24"]
  }
}

resource "google_dns_managed_zone" "vprofile-gke-dns" {
  name        = "vprofile-gke-dns"
  dns_name    = "vprofile-app.rrsinfo.xyz."
  description = "Vprofile DNS zone"
}

########################