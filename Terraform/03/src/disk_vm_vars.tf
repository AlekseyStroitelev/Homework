variable "hdd_name" {
    type        = string
    default     = "hdd-disk"
    description = "name of hdd-disk"  
}

variable "hdd_count" {
    type = number
    default = 3
    description = "count of hdd-disk"
}

variable "hdd_size" {
    type = number
    default = 1
    description = "size of hdd-disk"
}

variable "storage_vm" {
    type = map(object({
      name = string
      cpu  = number
      ram  = number
      fraction = number
    }))
    default = {
      storage = {
        name     = "storage"
        cpu      = 2
        ram      = 4
        fraction = 20        
      }
    }
}
