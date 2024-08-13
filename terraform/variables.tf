variable "project_id" {
  type        = string
  description = "Google Cloud project ID"
}

variable "region" {
  type        = string
  description = "Region where GKE cluster will be deployed"
  default     = "us-central1"
}
