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
