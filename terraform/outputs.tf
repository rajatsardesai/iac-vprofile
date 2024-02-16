output "cluster_name" {
  description = "Google Kubernetes Engine GKE Cluster Name"
  value       = module.gke.name
}

output "cluster_endpoint" {
  description = "Endpoint for Google Kubernetes Engine GKE "
  value       = module.gke.endpoint
  sensitive   = true
}

output "region" {
  description = "Google Kubernetes Engine GKE region"
  value       = var.region
}