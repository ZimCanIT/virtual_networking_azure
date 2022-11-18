variable "tenant_id" {
  type        = string
  description = "ZimCanIT org tenant id"
}
variable "subscription_id" {
  type        = string
  description = "Subscription within which resources are deployed"
}
#-------------------------------------------------------------

variable "vm_pwd" {
  type        = string
  description = "RDP password for virtual machines"
}
#-------------------------------------------------------------

locals {
  # refix for naming convention across all resources
  resource_prefix = "az104-04-"

  # ip addresses for x2 deployed subnets, iterated over with for_each block in network.tf
  subnet_ips = ["10.40.0.0/24", "10.40.1.0/24"]

  common_tags = {
    env   = "training"
    lab   = "az-104-lab-4"
    owner = "zimcanit"
  }
}

#-------------------------------------------------------------
