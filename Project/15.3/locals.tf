locals {
  vm_public_name  = "netology-vm${var.vpc_name}-platform-${var.public_subnet_name}"
  vm_private_name = "netology-vm${var.vpc_name}-platform-${var.private_subnet_name}"
  vm_nat_name     = "netology-nat${var.vpc_name}-platform-${var.public_subnet_name}"
}