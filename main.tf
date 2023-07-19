module "vpc" {
  source = "./modules/vpc"

  name = "my-vpc"
}

module "vms" {
  source = "./modules/vm"
  depends_on = module.vpc

  num_vms = var.num_vms
  machine_types = var.machine_types
  images = var.images
  zones = var.zones

  vpc_id = module.vpc.id
  subnet_id = module.vpc.subnet_id
}


locals {
  vm_ids = module.vms.vm_ids
  vm_names = module.vms.vm_names
  vpc_id = module.vpc.id
  subnet_id = module.vpc.subnet_id
}


