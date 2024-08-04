variable "network_name" {
  type = string
  default = "develop"
}

variable "network_labels" {
  description = "for dynamic block 'labels' "
  type        = map(string)
  default = {}
}

variable "environment_name" {
  description = "Environment name"
}

variable "network_zone" {
  type = string
  default = "ru-central1-a"
}

variable "network_vpc_cidr_blocks" {
  type = list(string)
  default = ["10.0.1.0/24"]
}
