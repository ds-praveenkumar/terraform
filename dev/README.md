### Terraform commands

```
cd dev

-- rg
terraform -chdir="./deployment/resource_group" init
terraform -chdir="./deployment/resource_group" plan -var-file=../../terraform.tfvars 
terraform -chdir="./deployment/resource_group" apply -var-file=../../terraform.tfvars -auto-approve

- vnet
terraform -chdir="./deployment/networking" init
terraform -chdir="./deployment/networking" plan -var-file=../../terraform.tfvars 
terraform -chdir="./deployment/networking" apply -var-file=../../terraform.tfvars -auto-approve

- subnet
terraform -chdir="./deployment/networking/subnet" init
terraform -chdir="./deployment/networking/subnet" plan -var-file=../../../terraform.tfvars 
terraform -chdir="./deployment/networking/subnet" apply -var-file=../../../terraform.tfvars -auto-approve

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