variable "tenant_id" {
  type        = string
  description = "ZimCanIT org tenant id"
}
variable "subscription_id" {
  type        = string
  description = "Subscription within which resources are deployed"
}
#-------------------------------------------------------------

locals {
  # refix for naming convention across all resources
  resource_prefix = "az104-04-"

  common_tags = {
    env   = "training"
    lab   = "az-104-lab-4"
    owner = "zimcanit"
  }
}