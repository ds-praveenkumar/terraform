
# azure region
variable "location" {
  type        = string
  description = "Azure region where the resource group will be created"
  default     = "East US 2"
}

variable "resource-group" {
  type    = string
  default = "test-rg"
}

 variable "service_vault_name" {}