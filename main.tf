variable "vm-settings-name-all" {
  type    = string
  default = "web"
}

variable "vm_instance-settings" {
  type = map(object({
    name             = string
    count            = number
    is_has_public_ip = bool
    label            = string
  }))
  default = {
    "test" = {
      name             = "web"
      count            = 2
      is_has_public_ip = true
      label            = "marketing"
    }
    "example" = {
      name             = "web"
      count            = 1
      is_has_public_ip = true
      label            = "analytics"
    }
  }
}

locals {
  vm_test-settings-name    = "${var.vm_instance-settings.test.name}-${var.env-develop}"
  vm_example-settings-name = "${var.vm_instance-settings.example.name}-${var.env-stage}"
}

module "test-vm" {
  source         = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"
  env_name       = var.env-develop
  network_id     = yandex_vpc_network.develop.id
  subnet_zones   = [var.zone-ru_central1_a, var.zone-ru_central1_b]
  subnet_ids     = [yandex_vpc_subnet.develop_a.id, yandex_vpc_subnet.develop_b.id]
  instance_name  = "${var.vm_instance-settings.test.name}-${var.env-develop}"
  instance_count = var.vm_instance-settings.test.count
  image_family   = var.family_os-ubuntu-name
  public_ip      = var.vm_instance-settings.test.is_has_public_ip

  labels = {
    projects = var.vm_instance-settings.test.label
  }

  metadata = {
    user-data          = data.template_file.cloudinit.rendered #Для демонстрации №3
    serial-port-enable = 1
  }

}

module "example-vm" {
  source         = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"
  env_name       = var.env-stage
  network_id     = yandex_vpc_network.develop.id
  subnet_zones   = [var.zone-ru_central1_a]
  subnet_ids     = [yandex_vpc_subnet.develop_a.id]
  instance_name  = "${var.vm_instance-settings.example.name}-${var.env-stage}"
  instance_count = var.vm_instance-settings.example.count
  image_family   = var.family_os-ubuntu-name
  public_ip      = var.vm_instance-settings.example.is_has_public_ip

  metadata = {
    user-data          = data.template_file.cloudinit.rendered #Для демонстрации №3
    serial-port-enable = 1
  }

  labels = {
    projects = var.vm_instance-settings.example.label
  }

}
