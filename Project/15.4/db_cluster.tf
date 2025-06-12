resource "yandex_mdb_mysql_cluster" "db-cluster" {
  name        = "mysql_db_cluster"
  environment = "PRESTABLE"
  network_id  = yandex_vpc_network.develop.id
  version     = "8.0"
  deletion_protection = true

  resources {
    resource_preset_id = "b1.medium"
    disk_type_id       = "network-ssd"
    disk_size          = 20
  }

  maintenance_window {
    type = "ANYTIME"
  }

  backup_window_start {
    hours   = 23
    minutes = 59
  }

  access {
    web_sql   = true
    data_lens = true
  }

  host {
    zone      = var.subnet.private-a.zone
    subnet_id = yandex_vpc_subnet.private-a.id
  }

  host {
    zone      = var.subnet.private-b.zone
    subnet_id = yandex_vpc_subnet.private-b.id
  }
}

resource "yandex_mdb_mysql_database" "mysql_db" {
  cluster_id = yandex_mdb_mysql_cluster.db-cluster.id
  name       = var.mysql_db_name
}

resource "yandex_mdb_mysql_user" "db_username" {
  cluster_id = yandex_mdb_mysql_cluster.db-cluster.id
  name       = "${file("./db_username")}"
  password   = "${file("./db_userpass")}"
  permission {
    database_name = yandex_mdb_mysql_database.mysql_db.name
    roles = ["ALL"]
  }
}
