resource "google_compute_instance" "vm" {
  count = var.num_vms

  name = "vm-${count.index}"
  machine_type = var.machine_types[count.index]
  zone = var.zones[count.index]

  boot_disk {
    initialize_params {
      image = var.images[count.index]
    }
  }
}
