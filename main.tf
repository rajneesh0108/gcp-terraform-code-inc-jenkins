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

  # The `vm_ids` and `vm_names` variables are defined as outputs of the
  # `module.vms` block.
  local.vm_ids = module.vms.vm_ids
  local.vm_names = module.vms.vm_names
}

# The `locals` block defines two local variables, `vm_ids` and `vm_names`,
# which are the outputs of the `module.vms` block.
