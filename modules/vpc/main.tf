resource "google_compute_network" "vpc" {
  name = var.name
  region = var.region
  ip_cidr_range = var.cidr_block
}

resource "google_compute_subnetwork" "subnet" {
  name = var.name
  region = var.region
  network = google_compute_network.vpc.name
  ip_cidr_range = "10.0.1.0/24"
}
