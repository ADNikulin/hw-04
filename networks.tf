variable "network_name" {
  type = string
  default = "develop"
  description = "network vpc name"
}

locals {
    vpc-settings-subnet-a = {
        name = "${var.network_name}-${var.zone-ru_central1_a}"
        zone = var.zone-ru_central1_a
        v4_cidr_blocks = ["10.0.1.0/24"]
    }
    vpc-settings-subnet-b = {
        name = "${var.network_name}-${var.zone-ru_central1_b}"
        zone = var.zone-ru_central1_b
        v4_cidr_blocks = ["10.0.2.0/24"]
    }
}

#создаем облачную сеть
resource "yandex_vpc_network" "develop" {
  name = var.network_name
}

#создаем подсеть
resource "yandex_vpc_subnet" "develop_a" {
  name           = local.vpc-settings-subnet-a.name
  zone           = local.vpc-settings-subnet-a.zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = local.vpc-settings-subnet-a.v4_cidr_blocks
}


resource "yandex_vpc_subnet" "develop_b" {
  name           = local.vpc-settings-subnet-b.name
  zone           = local.vpc-settings-subnet-b.zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = local.vpc-settings-subnet-b.v4_cidr_blocks
}


