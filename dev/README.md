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

- fieshare
terraform -chdir="./deployment/fileshare" init
terraform -chdir="./deployment/fileshare" plan -var-file=../../terraform.tfvars 
terraform -chdir="./deployment/fileshare" apply -var-file=../../terraform.tfvars -auto-approve

