resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}

resource "yandex_vpc_subnet" "web" {
  name           = var.vm_web_vpc_name
  zone           = var.vm_web_default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.vm_web_default_cidr
}

resource "yandex_vpc_subnet" "db" {
  name           = var.vm_db_vpc_name
  zone           = var.vm_db_default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.vm_db_default_cidr
}

data "yandex_compute_image" "ubuntu" {
  family = var.family
}

resource "yandex_compute_instance" "web" {
  name        = local.vm_web_name
  hostname    = local.vm_web_name
  platform_id = local.vm_web_platform_id
  zone        = local.vm_web_default_zone
  resources {
    cores         = var.vms_resources.web.core
    memory        = var.vms_resources.web.memory
    core_fraction = var.vms_resources.web.fraction
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
    subnet_id = yandex_vpc_subnet.web.id
    nat       = true
  }

  metadata = {
    serial-port-enable = var.metadata.vm.serial_port_enable
    ssh-keys           = "ubuntu:${var.metadata.vm.ssh-keys}"
  }
}

resource "yandex_compute_instance" "db" {
  name        = local.vm_db_name
  hostname    = local.vm_db_name
  platform_id = local.vm_db_platform_id
  zone        = local.vm_db_default_zone
  resources {
    cores         = var.vms_resources.db.core
    memory        = var.vms_resources.db.memory
    core_fraction = var.vms_resources.db.fraction
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
    subnet_id = yandex_vpc_subnet.db.id
    nat       = true
  }

  metadata = {
    serial-port-enable = var.metadata.vm.serial_port_enable
    ssh-keys           = "ubuntu:${var.metadata.vm.ssh-keys}"
  }
}
