resource "yandex_compute_instance" "vm" {
  count = var.count_vm
  name        = "${var.name_vm}-${count.index+1}"
  hostname    = "${var.name_vm}-${count.index+1}"
  platform_id = var.vm_platform_id
  zone        = var.default_zone
  resources {
    cores         = var.vms_resources.vm.core
    memory        = var.vms_resources.vm.memory
    core_fraction = var.vms_resources.vm.fraction
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
    subnet_id          = yandex_vpc_subnet.develop.id
    nat                = var.network_interface_nat
    security_group_ids = [yandex_vpc_security_group.example.id]
  }
  metadata = {
    serial-port-enable = var.serial_port
    ssh-keys           = "ubuntu:${var.ssh_keys}"
  }
}
