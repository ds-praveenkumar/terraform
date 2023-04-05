### Terraform commands

```
cd dev

-- rg
terraform -chdir=./deployment/resource_group init
terraform -chdir=./deployment/resource_group plan -var-file=../../terraform.tfvars
terraform -chdir=./deployment/resource_group apply -var-file=../../terraform.tfvars -auto-approve
terraform -chdir=./deployment/resource_group destroy -var-file=../../terraform.tfvars -auto-approve

- vnet
terraform -chdir=./deployment/networking init
terraform -chdir=./deployment/networking plan -var-file=../../terraform.tfvars
terraform -chdir=./deployment/networking apply -var-file=../../terraform.tfvars -auto-approve
terraform -chdir=./deployment/networking destroy -var-file=../../terraform.tfvars -auto-approve

- subnet
terraform -chdir="./deployment/networking/subnet" init
terraform -chdir="./deployment/networking/subnet" plan -var-file=../../../terraform.tfvars 
terraform -chdir="./deployment/networking/subnet" apply -var-file=../../../terraform.tfvars -auto-approve
terraform -chdir="./deployment/networking/subnet" destroy -var-file=../../../terraform.tfvars -auto-approve

- storage
terraform -chdir="./deployment/storage" init
terraform -chdir="./deployment/storage" plan -var-file=../../terraform.tfvars 
terraform -chdir="./deployment/storage" apply -var-file=../../terraform.tfvars -auto-approve

- fileshare
terraform -chdir="./deployment/fileshare" init
terraform -chdir="./deployment/fileshare" plan -var-file=../../terraform.tfvars 
terraform -chdir="./deployment/fileshare" apply -var-file=../../terraform.tfvars -auto-approve

- private endpoint
terraform -chdir="./deployment/private_endpoint" init
terraform -chdir="./deployment/private_endpoint" plan -var-file=../../terraform.tfvars 
terraform -chdir="./deployment/private_endpoint" apply -var-file=../../terraform.tfvars -auto-approve

- network interface 
terraform -chdir="./deployment/network_interface" init
terraform -chdir="./deployment/network_interface" plan -var-file=../../terraform.tfvars 
terraform -chdir="./deployment/network_interface" apply -var-file=../../terraform.tfvars -auto-approve

- winvm
terraform -chdir="./deployment/winvm" init
terraform -chdir="./deployment/winvm" plan -var-file=../../terraform.tfvars
terraform -chdir="./deployment/winvm" apply -var-file=../../terraform.tfvars -auto-approve

- recovery vault
terraform -chdir=./deployment/recovery_vault  init
terraform -chdir=./deployment/recovery_vault  plan -var-file=../../terraform.tfvars
terraform -chdir=./deployment/recovery_vault  apply -var-file=../../terraform.tfvars -auto-approve

- backup policy
terraform -chdir=./deployment/backup_policy init
terraform -chdir=./deployment/backup_policy plan -var-file=../../terraform.tfvars
terraform -chdir=./deployment/backup_policy apply -var-file=../../terraform.tfvars -auto-approve

- backup container

terraform -chdir=./deployment/backup_container
terraform -chdir=./deployment/backup_container plan -var-file=../../terraform.tfvars
terraform -chdir=./deployment/backup_container -var-file=../../terraform.tfvars -auto-approve

- backup_protected_file_share
terraform -chdir=./deployment/backup_protected_file_share init
terraform -chdir=./deployment/backup_protected_file_share  plan -var-file=../../terraform.tfvars 
terraform -chdir=./deployment/backup_protected_file_share  apply -var-file=../../terraform.tfvars -auto-approve

- vm stop schedule
terraform -chdir=./deployment/vm_stop_schedule init
terraform -chdir=./deployment/vm_stop_schedule plan -var-file=../../terraform.tfvars
terraform -chdir=./deployment/vm_stop_schedule apply  -var-file=../../terraform.tfvars -auto-approve
terraform -chdir=./deployment/vm_stop_schedule destroy  -var-file=../../terraform.tfvars -auto-approve

- managed identities
terraform -chdir=./deployment/manage_identities init
terraform -chdir=./deployment/manage_identities plan -var-file=../../terraform.tfvars
terraform -chdir=./deployment/manage_identities apply -var-file=../../terraform.tfvars -auto-approve
terraform -chdir=./deployment/manage_identities destroy -var-file=../../terraform.tfvars -auto-approve


- vm start automation
terraform -chdir=./deployment/automation_schedule init
terraform -chdir=./deployment/automation_schedule plan -var-file=../../terraform.tfvars
terraform -chdir=./deployment/automation_schedule apply  -var-file=../../terraform.tfvars -auto-approve

-- container registry
terraform -chdir=./deployment/container_registry  init
terraform -chdir=./deployment/container_registry plan -var-file=../../terraform.tfvars
terraform -chdir=./deployment/container_registry  apply -var-file=../../terraform.tfvars -auto-approve
terraform -chdir=./deployment/container_registry  destroy -var-file=../../terraform.tfvars -auto-approve

-- win function app
terraform -chdir=./deployment/win_function_app init
terraform -chdir=./deployment/win_function_app plan -var-file=../../terraform.tfvars
terraform -chdir=./deployment/win_function_app apply -var-file=../../terraform.tfvars -auto-approve
terraform -chdir=./deployment/win_function_app destroy -var-file=../../terraform.tfvars -auto-approve

-- web app
terraform -chdir=./deployment/web_app init
terraform -chdir=./deployment/web_app plan -var-file=../../terraform.tfvars 
terraform -chdir=./deployment/web_app apply -var-file=../../terraform.tfvars -auto-approve
terraform -chdir=./deployment/web_app destroy -var-file=../../terraform.tfvars -auto-approve

-- VM scale set
terraform -chdir=./deployment/win_vm_scale_set init
terraform -chdir=./deployment/win_vm_scale_set plan -var-file=../../terraform.tfvars
terraform -chdir=./deployment/win_vm_scale_set apply -var-file=../../terraform.tfvars -auto-approve
terraform -chdir=./deployment/win_vm_scale_set destroy -var-file=../../terraform.tfvars -auto-approve
