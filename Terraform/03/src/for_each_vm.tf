resource "yandex_compute_instance" "db" {
  for_each    = { for vm in var.each_vm: vm.vm_name => vm }
  name        = "${each.key}"
  hostname    = "${each.key}"
  platform_id = var.vm_platform_id
  zone        = var.default_zone
  resources {
    cores         = each.value.cpu
    memory        = each.value.ram
    core_fraction = each.value.fraction
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
  }
  metadata = {
    serial-port-enable = var.serial_port
    ssh-keys           = "ubuntu:${local.ssh_key}"
  }
}
