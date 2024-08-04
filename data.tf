### common
variable "family_os-ubuntu-name" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "family os name"
}

variable "packages" {
  type    = string
  default = "nginx"
}

data "yandex_compute_image" "ubuntu" {
  family = var.family_os-ubuntu-name
}

locals {
  userdata = {
    username       = "ubuntu"
    ssh_public_key = "${var.path_to_ssh_key}"
  }
}

