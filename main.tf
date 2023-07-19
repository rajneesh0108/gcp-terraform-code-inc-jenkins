module "vpc" {
  source = "./modules/vpc"

  name = "my-vpc"
}

module "vms" {
  source = "./modules/vm"

  num_vms = var.num_vms
  machine_types = var.machine_types
  images = var.images
  zones = var.zones

  depends_on = [module.vpc]
}

locals {
  vm_ids = module.vms.vm_ids
  vm_names = module.vms.vm_names
  vpc_id = google_compute_network.vpc.id
  subnet_id = google_compute_subnetwork.subnet.id

}
