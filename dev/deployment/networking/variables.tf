

variable "vnet_name" {}

variable "subnet_name" {}

variable "location" {}

variable "network_vnet_cidr" { }
  # type        = string
  # description = "The CIDR of the network VNET"
  # default     = "10.10.0.0/16"

# }



variable "endpoint_subnet_cidr" {
#   type        = string
#   description = "The CIDR for the endpoint subnet"
#   default     = "10.10.1.0/24"
}

# variable "subnet_name" {}

# variable "endpoint_subnet_cidr" {}