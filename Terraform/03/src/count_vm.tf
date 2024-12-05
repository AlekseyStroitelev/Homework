resource "yandex_compute_instance" "web" {
  count = var.count_vm_web
  name        = count.index + 1
  hostname    = count.index + 1
  platform_id = var.vm_platform_id
  zone        = var.default_zone
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
    preemptible = var.scheduling_policy_preemtible
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.web.id
    nat       = var.network_interface_nat
  }

  metadata = {
    serial-port-enable = var.metadata.vm.serial_port_enable
    ssh-keys           = "ubuntu:${var.metadata.vm.ssh-keys}"
  }
}
