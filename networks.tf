variable "network-settings" {
  type = map(object({
    name             = string
    zone             = string
    v4_cidr_blocks   = list(string)
    environment_name = string
  }))
  default = {
    "develop" = {
      environment_name = "develop"
      zone             = "ru-central1-a"
      name             = "develop"
      v4_cidr_blocks   = ["10.0.1.0/24"]
    }
  }
}

module "nw-netology" {
  source                  = "./modules/vpc"
  network_name            = var.network-settings.develop.name
  network_vpc_cidr_blocks = var.network-settings.develop.v4_cidr_blocks
  network_zone            = var.zone-ru_central1_a
  environment_name        = var.network-settings.develop.environment_name
}
