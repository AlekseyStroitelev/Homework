#VPC
resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}

#Subnets
resource "yandex_vpc_subnet" "public" {
  name           = var.public_subnet_name
  zone           = var.public_default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.public_default_cidr
}

resource "yandex_vpc_subnet" "private-a" {
  name           = var.private_subnet_name
  zone           = var.private_default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.private_default_cidr
  route_table_id = yandex_vpc_route_table.route_table.id
}

resource "yandex_vpc_subnet" "private-b" {
  name           = var.private_subnet_name
  zone           = var.private_default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.private_default_cidr
  route_table_id = yandex_vpc_route_table.route_table.id
}

resource "yandex_vpc_subnet" "private-d" {
  name           = var.private_subnet_name
  zone           = var.private_default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.private_default_cidr
  route_table_id = yandex_vpc_route_table.route_table.id
}

resource "yandex_vpc_route_table" "route_table" {
  name = "route_table"
  network_id = yandex_vpc_network.develop.id
  static_route {
    destination_prefix = "0.0.0.0/0"
    next_hop_address   = var.nat_ip_address
  }
}
