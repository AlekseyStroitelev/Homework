resource "yandex_compute_disk" "hdd" {
    count = var.hdd_count
    name  = "${var.hdd_name}-${count.index + 1}"
    size = var.hdd_size
}

resource "yandex_compute_instance" "storage_vm" {
  name        = var.storage_vm.storage.name
  hostname    = var.storage_vm.storage.name
  platform_id = var.vm_platform_id
  zone        = var.default_zone
  depends_on = [ yandex_compute_disk.hdd ]
  resources {
    cores         = var.storage_vm.storage.cpu
    memory        = var.storage_vm.storage.ram
    core_fraction = var.storage_vm.storage.fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
    dynamic "secondary_disk" {
        for_each = yandex_compute_disk.hdd
        content {
            disk_id = secondary_disk.value.id
     }
    }      
  scheduling_policy {
    preemptible = var.scheduling_policy_preemtible
  }
  network_interface {
    subnet_id          = yandex_vpc_subnet.develop.id
    nat                = var.network_interface_nat
  }
  metadata = {
    serial-port-enable = var.serial_port
    ssh-keys           = "ubuntu:${local.ssh_key}"
  }
}