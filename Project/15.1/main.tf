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

resource "yandex_vpc_subnet" "private" {
  name           = var.private_subnet_name
  zone           = var.private_default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.private_default_cidr
  route_table_id = yandex_vpc_route_table.route_table.id
}

#NAT-instance
resource "yandex_compute_instance" "nat" {
  name        = local.vm_nat_name
  hostname    = local.vm_nat_name
  zone        = var.public_default_zone
  resources {
    cores         = var.vms_resources.nat.core
    memory        = var.vms_resources.nat.memory
    core_fraction = var.vms_resources.nat.fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.nat_ubuntu.id
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id  = yandex_vpc_subnet.public.id
    nat        = true
    ip_address = var.nat_ip_address
  }

  metadata = {
    ssh-keys = "ubuntu:${file("./p_key.pub")}"
  }
}

#Public-instance
resource "yandex_compute_instance" "public" {
  name        = var.public_subnet_name
  hostname    = local.vm_public_name
  zone        = var.public_default_zone
  resources {
    cores         = var.vms_resources.public.core
    memory        = var.vms_resources.public.memory
    core_fraction = var.vms_resources.public.fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.public.id
    nat       = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file("./p_key.pub")}"
  }
}

#Private-instance
resource "yandex_compute_instance" "private" {
  name        = var.private_subnet_name
  hostname    = local.vm_private_name
  zone        = var.private_default_zone
  resources {
    cores         = var.vms_resources.private.core
    memory        = var.vms_resources.private.memory
    core_fraction = var.vms_resources.private.fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.private.id
    nat       = false
  }

  metadata = {
    ssh-keys = "ubuntu:${file("./p_key.pub")}"
  }
}

resource "yandex_vpc_route_table" "route_table" {
  name = "route_table"
  network_id = yandex_vpc_network.develop.id
  static_route {
    destination_prefix = "0.0.0.0/0"
    next_hop_address   = var.nat_ip_address
  }
}

#Data
data "yandex_compute_image" "ubuntu" {
  family = var.family
}

data "yandex_compute_image" "nat_ubuntu" {
  family = var.nat_ubuntu_family
}
