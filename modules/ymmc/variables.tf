variable "name" {
  type = string
}

variable "environment" {
  type = string
}

variable "network_id" {
  type = string
}

variable "subnet_ids" {
  type = list(object({
    zone = string,
    subnet_id = string
  }))
}

variable "HA" {
  type = bool
  default = false
}

