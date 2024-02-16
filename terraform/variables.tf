variable "project_id" {
  description = "GCP Project id"
  type        = string
  default     = "gitops-414406"
}

variable "region" {
  description = "GCP region"
  type        = string
  default     = "us-central1"
}

variable "clusterName" {
  description = "Name of the kubernetes engine cluster"
  type        = string
  default     = "vprofile-gke"
}

variable "ip_range_pods" {
  description = "IP address assigned to pods within the Kubernetes cluster"
  type        = string
  default     = "172.20.4.0/24"
}

variable "ip_range_services" {
  description = "IP address assigned to services within the Kubernetes cluster"
  type        = string
  default     = "172.20.7.0/24"
}

##