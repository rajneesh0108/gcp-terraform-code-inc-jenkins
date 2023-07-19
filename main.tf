module "vms" {
  source = "./modules/vm"

  num_vms = var.num_vms
  machine_types = var.machine_types
  images = var.images
  zones = var.zones
}

module "vpc" {
  source = "./modules/vpc"

  name = "my-vpc"
}

locals {
  vm_ids = module.vms.vm_ids
  vm_names = module.vms.vm_names
}


