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
