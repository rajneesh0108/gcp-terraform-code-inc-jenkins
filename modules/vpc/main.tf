locals {
    vpc_id = google_compute_network.vpc.id
    subnet_id = google_compute_subnetwork.subnet.id
  }

resource "google_compute_network" "vpc" {
  name = var.name
}

resource "google_compute_subnetwork" "subnet" {
  name = var.name
  region = var.region
  network = google_compute_network.vpc.name
  ip_cidr_range = "10.0.1.0/24"
