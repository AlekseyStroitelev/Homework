###cloud vars

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

variable "family" {
  type = string
  default = "ubuntu-2004-lts"
  description = "The name of the image family to which this image belongs"
}

# variable "vm_web_name" {
#   type = string
#   default = "netology-develop-platform-web"
#   description = "Resource name"  
# }

variable "vm_web_platform_id" {
  type = string
  default = "standard-v1"
  description = "The type of virtual machine to create. The default is standard-v1"  
}

# variable "vm_web_core" {
#   type = number
#   default = 2
#   description = "CPU cores for the instance"
# }

# variable "vm_web_memory" {
#   type = number
#   default = 2
#   description = "Memory size in GB"
# }

# variable "vm_web_core_fraction" {
#   type = number
#   default = 5
#   description = "If provided, specifies baseline performance for a core as a percent"
# }

variable "vm_web_default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "vm_web_default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network & subnet name"
}

variable "vm_web_vpc_name" {
  type        = string
  default     = "web"
  description = "VPC network & subnet name"
}

###ssh vars

# variable "vms_ssh_root_key" {
#   type        = string
#   default     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJ+eCdyUkojw4hF52nM/4WO8P53gbu+Q5A1n56r0b5VL"
#   description = "ssh-keygen -t ed25519"
# }

variable "metadata" {
  type = map(object({
    serial_port_enable = bool
    ssh-keys           = string
  }))
  default = {
    vm = {
      serial_port_enable = true
      ssh-keys           = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJ+eCdyUkojw4hF52nM/4WO8P53gbu+Q5A1n56r0b5VL"
    }
  }
}

variable "vms_resources" {
  type    = map(object({
    core     = number
    memory   = number
    fraction = number
  }))
  default = {
    web = {
      core     = 2
      memory   = 2
      fraction = 5
    }
    db = {
      core     = 2
      memory   = 2
      fraction = 20
    }
  }
}