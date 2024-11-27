locals {

  vm_web_name          = "netology-${var.vpc_name}-platform-${var.vm_web_vpc_name}"
  vm_web_platform_id   = "${var.vm_web_platform_id}"
  # vm_web_core          = "${var.vm_web_core}"
  # vm_web_memory        = "${var.vm_web_memory}"
  # vm_web_core_fraction = "${var.vm_web_core_fraction}"
  vm_web_default_zone  = "${var.vm_web_default_zone}"

  vm_db_name          = "netology-${var.vpc_name}-platform-${var.vm_db_vpc_name}"
  vm_db_platform_id   = "${var.vm_db_platform_id}"
  # vm_db_core          = "${var.vm_db_core}"
  # vm_db_memory        = "${var.vm_db_memory}"
  # vm_db_core_fraction = "${var.vm_db_core_fraction}"
  vm_db_default_zone  = "${var.vm_db_default_zone}"

}