output "vpc_subnets" {
  value = [for itm in yandex_vpc_subnet.vpc_subnet_instance : {
    name       = itm.name,
    zone       = itm.zone,
    network_id = itm.network_id,
    cidr       = itm.v4_cidr_blocks
    subnet_id  = itm.id
  }]
}

output "vpc_network" {
  value = {
    network_id = yandex_vpc_network.vpc_network_instance.id
  }
}
