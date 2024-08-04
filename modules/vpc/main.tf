locals {
  network_name    = var.environment_name == var.network_name ? var.network_name : "${var.environment_name}-${var.network_name}"
  labels = length(keys(var.network_labels)) > 0 ? var.network_labels : {
    "env"     = var.environment_name
    "project" = "undefined"
  }
  subnets = [for itm in var.subnets : {
    "zone" = itm.zone
    "cidr" = [itm.cidr]
  }]
}

#создаем облачную сеть
resource "yandex_vpc_network" "vpc_network_instance" {
  name = local.network_name
}

#создаем подсеть
resource "yandex_vpc_subnet" "vpc_subnet_instance" {
  for_each = {
    for index, itm in local.subnets: 
    itm.zone => itm # Perfect, since VM names also need to be unique
    # OR: index => vm (unique but not perfect, since index will change frequently)
    # OR: uuid() => vm (do NOT do this! gets recreated everytime)

  }
  
  name           = "${local.network_name}-${each.value.zone}"
  zone           = each.value.zone
  network_id     = yandex_vpc_network.vpc_network_instance.id
  v4_cidr_blocks = each.value.cidr
  labels         = { for k, v in local.labels : k => v }
}

