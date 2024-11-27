###cloud vars

# variable "vm_db_name" {
#   type = string
#   default = "netology-develop-platform-db"
#   description = "Resource name"  
# }

variable "vm_db_platform_id" {
  type = string
  default = "standard-v1"
  description = "The type of virtual machine to create. The default is standard-v1"  
}

# variable "vm_db_core" {
#   type = number
#   default = 2
#   description = "CPU cores for the instance"
# }

# variable "vm_db_memory" {
#   type = number
#   default = 2
#   description = "Memory size in GB"
# }

# variable "vm_db_core_fraction" {
#   type = number
#   default = 20
#   description = "If provided, specifies baseline performance for a core as a percent"
# }

variable "vm_db_default_zone" {
    type        = string
    default     = "ru-central1-b"
    description = "Default zone for netology-develop-platform-db"
}

variable "vm_db_default_cidr" {
  type        = list(string)
  default     = ["10.0.2.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vm_db_vpc_name" {
  type        = string
  default     = "db"
  description = "VPC network & subnet name"
}
