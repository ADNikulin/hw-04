locals {
  network_name    = "${var.environment_name}-${var.network_name}"
  subnebt_name    = "${var.environment_name}-${var.network_name}-subnet-a"
  subnet_zone     = var.network_zone
  subnet_ip_bloks = var.network_vpc_cidr_blocks
  labels = length(keys(var.network_labels)) > 0 ? var.network_labels : {
    "env"     = var.environment_name
    "project" = "undefined"
  }
}

#создаем облачную сеть
resource "yandex_vpc_network" "vpc_network_instance" {
  name = local.network_name
}

#создаем подсеть
resource "yandex_vpc_subnet" "vpc_subnet_instance" {
  name           = local.subnebt_name
  zone           = local.subnet_zone
  network_id     = yandex_vpc_network.vpc_network_instance.id
  v4_cidr_blocks = local.subnet_ip_bloks
  labels         = { for k, v in local.labels : k => v }
}

