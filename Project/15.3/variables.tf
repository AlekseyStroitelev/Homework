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

#Public subnet
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

#Private subnet
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

#Storage
variable "netology_bucket" {
  type = object({
    bucket                = string
    max_size              = number
    default_storage_class = string
    acl                   = string
  })
  default = {
    bucket                = "alexey14052025"
    max_size              = 1073741824
    default_storage_class = "STANDARD"
    acl                   = "public-read"
  }
}

variable "picture_name" {
  type        = string
  default     = "picture.jpg"
  description = "Picture name"
}

variable "object_picture" {
  type = object({
    key    = string
    source = string
  })
  default = {
    key    = "picture.jpg"
    source = "./pictures/picture.jpg"
  }
}

#Group instance
variable "group_develop_name" {
  type        = string
  default     = "group-develop"
  description = "Name of groupe instance develop"  
}

variable "lamp_image_id" {
  type        = string
  default     = "fd8g59ke0tv5mtdfiehe"
  description = "LAMP image id"  
}

variable "group_instance_resources" {
  type = object({
    cores        = number
    memory       = number
    fraction     = number
    nat          = bool
    network_type = string
  })
  default = {
    cores        = 2
    memory       = 2
    fraction     = 20
    nat          = false
    network_type = "STANDARD"
  }
}

variable "scale_policy_fixed_scale" {
  type        = number
  default     = 3
  description = "Number of instances in group instance"
}

variable "load_balancer_target_group_name" {
  type        = string
  default     = "target-lb"
  description = "Name of target group for load balancer"
}

variable "deploy_policy" {
  type = object({
    max_unavailable = number
    max_expansion   = number 
  })
  default = {
    max_unavailable = 2
    max_expansion   = 3
  }
}

variable "health_check" {
  type = object({
    interval            = number
    timeout             = number
    healthy_threshold   = number
    unhealthy_threshold = number
    http_options_path   = string
    http_options_port   = number 
  })
  default = {
    interval            = 15
    timeout             = 5
    healthy_threshold   = 5
    unhealthy_threshold = 2
    http_options_path   = "/"
    http_options_port   = 80
  }
}

#Group instance service account
variable "group_instance_sa" {
  type = object({
    name   = string
    role   = string
  })
  default = {
    name   = "group-sa"
    role   = "admin"
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
    name              = "netology-bucket-key"
    description       = "Symmetric key for netology bucket"
    default_algorithm = "AES_256"
    rotation_period   = "168h"
  }
}
