variable "family" {
  type = string
  default = "ubuntu-2004-lts"
  description = "The name of the image family to which this image belongs"
}

variable "count_vm" {
  type = number
  default = 2
  description = "The number of virtual machines"
}

variable "name_vm" {
  type        = string
  default     = "web"
  description = "Name vms resources"
}

variable "vm_platform_id" {
  type = string
  default = "standard-v1"
  description = "The type of virtual machine to create. The default is standard-v1"  
}

variable "scheduling_policy_preemtible" {
  type = bool
  default = true
  description = "Scheduling policy configuration"
}

variable "network_interface_nat" {
  type = bool
  default = true
  description = "Provide a public address, for instance, to access the internet over NAT" 
}

variable "serial_port"   {
  type = bool
  default = true
  description = "Metadata key"
}

variable "ssh_keys" {
  type = string
  description = "Metadata key"
}

variable "vms_resources" {
  type    = map(object({
    core     = number
    memory   = number
    fraction = number
  }))
  default = {
    vm = {
      core     = 2
      memory   = 2
      fraction = 5
    }
   }
}
