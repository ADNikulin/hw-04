variable "network-settings" {
  type = map(object({
    name             = string
    environment_name = string
    subnets = list(object({
      zone = string
      cidr = string
    }))
  }))
  default = {
    "develop" = {
      environment_name = "develop"
      name             = "develop"
      subnets = [{
        cidr = "10.0.1.0/24"
        zone = "ru-central1-a"
        }, {
        zone = "ru-central1-b"
        cidr = "10.0.2.0/24"
      }]
    },
    "production" = {
      environment_name = "production"
      name             = "production"
      subnets = [{
        cidr = "10.0.1.0/24"
        zone = "ru-central1-a"
        }, {
        zone = "ru-central1-b"
        cidr = "10.0.2.0/24"
        }, {
        zone = "ru-central1-c"
        cidr = "10.0.3.0/24"
      }]
    }
  }
}

module "nw-netology" {
  source           = "./modules/vpc"
  network_name     = var.network-settings.develop.name
  environment_name = var.network-settings.develop.environment_name
  subnets          = var.network-settings.develop.subnets
}

module "nw-netology-production" {
  source           = "./modules/vpc"
  network_name     = var.network-settings.production.name
  environment_name = var.network-settings.production.environment_name
  subnets          = var.network-settings.production.subnets
}
