module "vpc" {
  source = "./modules/vpc"

  name = "my-vpc"
}

module "vms" {
  source = "./modules/vm"
  depends_on = [module.vpc]

  num_vms = var.num_vms
  machine_types = var.machine_types
  images = var.images
  zones = var.zones

  # The `vpc_id` and `subnet_id` variables are defined as outputs of the
  # `module.vpc` block.
  vpc_id = module.vpc.outputs.id
  subnet_id = module.vpc.outputs.subnet_id

  # The `locals` block defines two local variables, `vm_ids` and `vm_names`,
  # which are the outputs of the `module.vms` block.
  locals {
    vm_ids = module.vms.vm_ids
    vm_names = module.vms.vm_names
  }
}
