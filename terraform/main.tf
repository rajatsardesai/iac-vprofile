provider "kubernetes" {
  host                   = "https://${module.gke.endpoint}"
  token                  = data.google_client_config.default.access_token
  cluster_ca_certificate = base64decode(module.gke.ca_certificate)
}

data "google_client_config" "default" {}

locals {
  cluster_name = var.clusterName
}

resource "google_compute_network" "network" {
  name                    = "vprofile-gke-network"
  auto_create_subnetworks = false
}

resource "google_compute_router" "router" {
  name    = "vprofile-gke-router"
  network = google_compute_network.network.name
  region  = var.region
}

resource "google_compute_router_nat" "nat_manual" {
  name   = "vprofile-gke-nat"
  router = google_compute_router.router.name
  region = var.region

  nat_ip_allocate_option = "AUTO_ONLY"

  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_PRIMARY_IP_RANGES"
}

resource "google_dns_managed_zone" "vprofile-gke-dns" {
  name        = "vprofile-gke-dns"
  dns_name    = "rrsinfo.xyz."
  description = "Vprofile DNS zone"
}

########################