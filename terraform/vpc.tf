module "vpc" {
  source  = "terraform-google-modules/network/google"
  version = "~> 9.0"

  project_id   = var.project_id
  network_name = "vpro-gke"

  subnets = [
    {
      subnet_name           = "public-subnet-1"
      subnet_ip             = "172.20.4.0/24"
      subnet_region         = var.region
      subnet_private_access = false
      subnet_flow_logs      = false
    },
    {
      subnet_name           = "public-subnet-2"
      subnet_ip             = "172.20.5.0/24"
      subnet_region         = var.region
      subnet_private_access = false
      subnet_flow_logs      = false
    },
    {
      subnet_name           = "public-subnet-3"
      subnet_ip             = "172.20.6.0/24"
      subnet_region         = var.region
      subnet_private_access = false
      subnet_flow_logs      = false
    },
    {
      subnet_name           = "public-subnet-4"
      subnet_ip             = "172.20.8.0/24"
      subnet_region         = var.region
      subnet_private_access = false
      subnet_flow_logs      = false
    },
    {
      subnet_name           = "private-subnet-1"
      subnet_ip             = "172.20.1.0/24"
      subnet_region         = var.region
      subnet_private_access = true
      subnet_flow_logs      = false
    },
    {
      subnet_name           = "private-subnet-2"
      subnet_ip             = "172.20.2.0/24"
      subnet_region         = var.region
      subnet_private_access = true
      subnet_flow_logs      = false
    },
    {
      subnet_name           = "private-subnet-3"
      subnet_ip             = "172.20.3.0/24"
      subnet_region         = var.region
      subnet_private_access = true
      subnet_flow_logs      = false
    },
    {
      subnet_name           = "private-subnet-4"
      subnet_ip             = "172.20.9.0/24"
      subnet_region         = var.region
      subnet_private_access = true
      subnet_flow_logs      = false
    }
  ]

  secondary_ranges = {
    public-subnet-2 = [
      {
        range_name    = "pods-range"
        ip_cidr_range = "172.20.0.0/24"
      },
      {
        range_name    = "services-range"
        ip_cidr_range = "172.20.7.0/24"
      }
    ]
  }
}
