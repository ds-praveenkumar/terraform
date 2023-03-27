
##########################
# Resource group 
##########################

resource_group_name = "test-rg"
location = "East US 2"

##########################
# Storage account 
##########################

storage_name    = "testsanewrg2"
new_storage_name    = "testsanewrg3"
file_share_name = "testfs"

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

vm_name              = "testvm"
endpoint_subnet_cidr = "10.10.1.0/24"


##########################
# Recovery vault 
##########################

recovery_vault_name = "testrsv"


##########################
# Backup Policy name 
##########################
bkp_policy_name = "testbkpolicy"

##########################
# Private Endpoint 
##########################
pvt_end_point_name = "test_pvt"
pvc_name           = "test_psc"



##########################
# Network Interface 
##########################
network_interface_name = "test_nic"
ip_config_name         = "test_ipconf"