
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


##########################
# Win Virtual Machine Schedule
##########################
timezone                = "Eastern Standard Time"
daily_recurrence_time   = "1900"
auto_scale_profile_name = "autoscaleProfile"
auto_scale_settings     = "autoScalSettings"
metric_name             = "Percentage CPU"
default_count           = 5
min_count               = 5
max_count               = 16
auto_scale_name         = "testvmss"

##########################
# Automation Schedule Start 
##########################
automation_account_name  = "StartVM"
automation_schedule_name = "testautomation"
# start_time               = "2023-03-29T10:00:00Z"
sku_name                 = "Basic"
time_zone                = "America/Chicago"
runbook_name             = "test_vm_start"


##########################
# Manage Identity
##########################
role_name               = "StopStartVM"
user_assigned_id_name   = "development-automation"


##########################
# container Registery
##########################
acr_name = "Testacrgit"


##########################
# win Func App
##########################
sp_name = "test-app-service-plan"
fn_name = "test-app"


##########################
# Web App
##########################
web_app_name    = "test-webapp"
asp_name        = "test-asp" 
web_sku_name    = "F1"

#############################
# Windows machine scale set 
#############################
upscale_threshold = 90 
inscale_threshold = 10
