#VPC
resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}

#Subnets
resource "yandex_vpc_subnet" "public-a" {
  name           = var.subnet.public-a.name
  zone           = var.subnet.public-a.zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.subnet.public-a.cidr
}

resource "yandex_vpc_subnet" "public-b" {
  name           = var.subnet.public-b.name
  zone           = var.subnet.public-b.zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.subnet.public-b.cidr
}

resource "yandex_vpc_subnet" "public-d" {
  name           = var.subnet.public-d.name
  zone           = var.subnet.public-d.zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.subnet.public-d.cidr
}

resource "yandex_vpc_subnet" "private-a" {
  name           = var.subnet.private-a.name
  zone           = var.subnet.private-a.zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.subnet.private-a.cidr
}

resource "yandex_vpc_subnet" "private-b" {
  name           = var.subnet.private-b.name
  zone           = var.subnet.private-b.zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.subnet.private-b.cidr
}

resource "yandex_vpc_security_group" "mysql_sg" {
  name        = "mysql-security-group"
  network_id  = yandex_vpc_network.develop.id

  ingress {
    description    = "MySQL"
    port           = 3306
    protocol       = "TCP"
    v4_cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    protocol       = "ANY"
    v4_cidr_blocks = ["0.0.0.0/0"]
  }
}
