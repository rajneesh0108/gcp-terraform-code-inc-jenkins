resource "google_compute_instance" "vms" {
  count = var.num_vms

  name = "vm-${count.index}"
  machine_type = var.machine_types[count.index]
  zone = var.zones[count.index]

  boot_disk {
    initialize_params {
      image = var.images[count.index]
}
}
  network_interface {
    network = "default"  # Replace with the name of your VPC network
    access_config {
      // Ephemeral IP will be assigned
    }
  }
}
