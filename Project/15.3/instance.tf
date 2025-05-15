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
  name        = local.vm_public_name
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
  name        = local.vm_private_name
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
