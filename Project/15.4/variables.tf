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

#Subnet
variable "subnet" {
  type = map(object({
    name = string
    zone = string
    cidr = list(string) 
  }))
  default = {
    public-a = {
      name = "public-a"
      zone = "ru-central1-a"
      cidr = ["10.45.10.0/24"]
    }
    public-b = {
      name = "public-b"
      zone = "ru-central1-b"
      cidr = ["10.45.20.0/24"]
    }
    public-d = {
      name = "public-d"
      zone = "ru-central1-d"
      cidr = ["10.45.30.0/24"]
    }
    private-a = {
      name = "private-a"
      zone = "ru-central1-a"
      cidr = ["192.168.10.0/24"]
    }
    private-b = {
      name = "private-b"
      zone = "ru-central1-b"
      cidr = ["192.168.20.0/24"]
    }
  }
}

#MYSQL_DB
variable "mysql_db_name" {
  type    = string
  default = "netology_db"
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

#Create KMS Symmetric Key.
variable "storage_symmetric_key" {
  type = object({
    name              = string
    description       = string
    default_algorithm = string
    rotation_period   = string
  })
  default = {
    name              = "k8s-key"
    description       = "Symmetric key for k8s"
    default_algorithm = "AES_256"
    rotation_period   = "168h"
  }
}
