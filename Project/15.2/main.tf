#Data
data "yandex_compute_image" "ubuntu" {
  family = var.family
}

data "yandex_compute_image" "nat_ubuntu" {
  family = var.nat_ubuntu_family
}
