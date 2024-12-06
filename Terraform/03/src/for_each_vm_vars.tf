variable "each_vm" {
  type = list(object({
      vm_name  = string
      cpu      = number
      ram      = number 
      fraction = number
      }))
  default = [
    {
      vm_name  = "main"
      cpu      = 2
      ram      = 2
      fraction = 5
    },
    {
      vm_name  = "replica"
      cpu      = 2
      ram      = 4
      fraction = 20
    }
  ]   
}
