resource "yandex_mdb_mysql_database" "ymm_db" {
  cluster_id = yandex_mdb_mysql_cluster.ymm_cluster.id
  name       = var.name-db
}

resource "yandex_mdb_mysql_cluster" "ymm_cluster" {
  name        = var.name
  environment = var.environment
  network_id  = var.network_id
  version     = "8.0"

  resources {
    resource_preset_id = "s2.micro"
    disk_type_id       = "network-ssd"
    disk_size          = 16
  }

  host {
    zone      = var.zone
    subnet_id = var.subnet_id
  }
}
