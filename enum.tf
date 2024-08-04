variable "zone-ru_central1_a" {
  type = string
  default = "ru-central1-a"
  description = "zone on ru-central1-a"
}

variable "zone-ru_central1_b" {
  type = string
  default = "ru-central1-b"
  description = "zone on ru-central1-b"
}

variable "zone-ru_central1_c" {
  type = string
  default = "ru-central1-c"
  description = "zone on ru-central1-c"
}

variable "zone-ru_central1_d" {
  type = string
  default = "ru-central1-d"
  description = "zone on ru-central1-d"
}

variable "env-develop" {
  type = string
  default = "develop"
}

variable "env-stage" {
  type = string
  default = "stage"
}

locals {
  zone-default_zone = var.zone-ru_central1_a
}