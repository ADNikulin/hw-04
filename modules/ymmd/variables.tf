variable "name" {
  type = string
  default = "test"
}

variable "name-db" {
  type = string
  default = "testdb"
}

variable "environment" {
  type = string
  default = "develop"
}

variable "network_id" {
  type = string
}

variable "zone" {
  type = string
  default = "ru-central1-a"
}

variable "subnet_id" {
  type = string
}