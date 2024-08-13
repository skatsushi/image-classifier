provider "google" {
  project = var.project_id
  region  = var.region
}

resource "google_container_cluster" "primary" {
  name     = "image-classifier-cluster"
  location = var.region
  initial_node_count = 3
}

resource "google_container_node_pool" "primary_nodes" {
  name       = "image-classifier-node-pool"
  location   = var.region
  cluster    = google_container_cluster.primary.name
  node_count = 3

  node_config {
    machine_type = "e2-medium"
  }
}

output "kubernetes_cluster_name" {
  value = google_container_cluster.primary.name
}
