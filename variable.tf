variable "num_vms" {
  type = number
  default = 3
}

variable "machine_types" {
  type = list(string)
  default = ["n1-standard-1", "n1-standard-2", "n1-standard-4"]
}

variable "images" {
  type = list(string)
  default = ["debian-cloud/debian-11", "debian-cloud/debian-10", "ubuntu-os-cloud/ubuntu-20.04"]
}

variable "zones" {
  type = list(string)
  default = ["us-central1-a", "us-central1-b", "us-central1-c"]
}
