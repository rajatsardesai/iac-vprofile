module "gke" {
  source     = "terraform-google-modules/kubernetes-engine/google"
  project_id = var.project_id

  name               = local.cluster_name
  region             = var.region
  network            = module.vpc.network_name
  subnetwork         = module.vpc.module.subnets.google_compute_subnetwork.subnetwork["us-central1/private-subnet-1"]
  ip_range_pods      = "172.20.0.0/16"
  ip_range_services  = "172.20.7.0/26"
  initial_node_count = 2

  node_pools = [
    {
      name               = "node-pool-1"
      machine_type       = "n1-standard-1" # GKE does not have direct equivalents to AWS instance types, using n1-standard-1 as an example
      initial_node_count = 2
      min_count          = 1
      max_count          = 3
    },
    {
      name               = "node-pool-2"
      machine_type       = "n1-standard-1"
      initial_node_count = 1
      min_count          = 1
      max_count          = 2
    }
  ]
}
