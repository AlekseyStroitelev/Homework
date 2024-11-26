###cloud vars
variable "vm_web_yandex_compute_image_family" {
  type = string
  default = "ubuntu-2004-lts"
  description = "The name of the image family to which this image belongs"
}

variable "vm_web_yandex_compute_instance_name" {
  type = string
  default = "netology-develop-platform-web"
  description = "Resource name"  
}

variable "vm_web_yandex_compute_instance_platform_id" {
  type = string
  default = "standard-v1"
  description = "The type of virtual machine to create. The default is standard-v1"  
}

variable "vm_web_yandex_compute_instance_resources_core" {
  type = number
  default = 2
  description = "CPU cores for the instance"
}

variable "vm_web_yandex_compute_instance_resources_memory" {
  type = number
  default = 2
  description = "Memory size in GB"
}

variable "vm_web_yandex_compute_instance_resources_core_fraction" {
  type = number
  default = 5
  description = "If provided, specifies baseline performance for a core as a percent"
}

variable "cloud_id" {
  type        = string
  default     = "b1gj2n9n1isp9elpqjgg"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  default     = "b1g6kcqbrg8j96ko3b54"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network & subnet name"
}


###ssh vars

variable "vms_ssh_root_key" {
  type        = string
  default     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJ+eCdyUkojw4hF52nM/4WO8P53gbu+Q5A1n56r0b5VL"
  description = "ssh-keygen -t ed25519"
}
