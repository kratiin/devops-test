# terraform/main.tf
provider "google" {
  project = "your-project-id"
  region  = "us-central1"
}

resource "google_compute_network" "vpc_network" {
  name = "sample-vpc"
}

resource "google_compute_subnetwork" "subnet" {
  name          = "sample-subnet"
  ip_cidr_range = "10.0.0.0/16"
  region        = "us-central1"
  network       = google_compute_network.vpc_network.self_link
}

resource "google_container_cluster" "primary" {
  name               = "sample-gke-cluster"
  location           = "us-central1"
  network            = google_compute_network.vpc_network.name
  subnetwork         = google_compute_subnetwork.subnet.name

  initial_node_count = 3
  node_config {
    machine_type = "e2-medium"
  }

  workload_identity_config {
    workload_pool = "your-project-id.svc.id.goog"
  }
}
