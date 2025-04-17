variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network & subnet name"
}

variable "cloud_id" {
  type        = string
  default     = "b1gj2n9n1isp9elpqjgg"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  default     = "b1gaq0q0qlsinbdr072s"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "family" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "The name of the image family to which this image belongs"
}

variable "nat_ubuntu_family" {
  type = string
  default = "nat-instance-ubuntu"
  description = "The name of the image family to which this image belongs"
}

#public subnet
variable "public_subnet_name" {
  type        = string
  default     = "public"
  description = "VPC network & subnet name"
}

variable "public_default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "public_default_cidr" {
  type        = list(string)
  default     = ["192.168.10.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

#private subnet
variable "private_subnet_name" {
  type        = string
  default     = "private"
  description = "VPC network & subnet name"
}

variable "private_default_zone" {
  type        = string
  default     = "ru-central1-b"
  description = "Default zone for netology-develop-platform-db"
}

variable "private_default_cidr" {
  type        = list(string)
  default     = ["192.168.20.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

#Instances
variable "vms_resources" {
  type    = map(object({
    core     = number
    memory   = number
    fraction = number
  }))
  default  = {
    nat    = {
      core     = 2
      memory   = 2
      fraction = 5
    }
    public = {
      core     = 2
      memory   = 2
      fraction = 20
    }
    private = {
      core     = 2
      memory   = 2
      fraction = 20
    }
  }
}

variable "nat_ip_address" {
  type        = string
  default     = "192.168.10.254"
  description = "Default NAT-instance IP-address"  
}
