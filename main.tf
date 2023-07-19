module "vms" {
  source = "./modules/vm"

  num_vms = var.num_vms
  machine_types = var.machine_types
  images = var.images
  zones = var.zones
}
