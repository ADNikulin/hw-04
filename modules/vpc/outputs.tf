output "vpc_subnet" {
  value = {
    name       = yandex_vpc_subnet.vpc_subnet_instance.name,
    zone       = yandex_vpc_subnet.vpc_subnet_instance.zone,
    network_id = yandex_vpc_subnet.vpc_subnet_instance.network_id,
    cidr       = yandex_vpc_subnet.vpc_subnet_instance.v4_cidr_blocks
    subnet_id  = yandex_vpc_subnet.vpc_subnet_instance.id
  }
}

output "vpc_network" {
  value = {
    network_id = yandex_vpc_network.vpc_network_instance.id
  }
}
