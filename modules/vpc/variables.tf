variable "name" {
  type = string
  default = "my-vpc"
}

variable "cidr_block" {
  type = string
  default = "10.0.0.0/16"
}

variable "region" {
  type = string
  default = "us-central1"
}
