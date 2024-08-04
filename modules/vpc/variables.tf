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

variable "subnets" {
  type = list(object({
    zone = string
    cidr = string
  }))
  default = [{
    zone = "ru-central1-a"
    cidr = "10.0.1.0/24"
  }]
  description = "list of subnets "
  nullable = false
  sensitive = false
}
