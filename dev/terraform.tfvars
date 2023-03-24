
##########################
# Resource group 
##########################

resource_group_name = "test-rg"
location = "East US 2"

##########################
# Storage account 
##########################

storage_name = "testsanewrg2"

##########################
# Virtual Network 
##########################

vnet_name         = "test_vnet"
network_vnet_cidr = "10.10.0.0/16"
subnet_name       = "test_subnet"
dns_zone_name     = "privatelink.blob.core.windows.net"

##########################
# Win Virtual Machine 
##########################

vm_name = "test_vm"
endpoint_subnet_cidr = "10.10.1.0/24"


##########################
# recovery vault 
##########################

recovery_vault_name = "test_rsv"
