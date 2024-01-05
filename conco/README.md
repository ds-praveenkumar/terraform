
- rg
terraform -chdir=dev/deployment/resource_group init
terraform -chdir=dev/deployment/resource_group plan -var-file=../../../terraform.tfvars
terraform -chdir=dev/deployment/resource_group apply -var-file=../../../terraform.tfvars -auto-approve
terraform -chdir=dev/deployment/resource_group destroy -var-file=../../../terraform.tfvars -auto-approve

- storage

terraform -chdir="dev/deployment/storage" init
terraform -chdir="dev/deployment/storage" plan -var-file=../../../terraform.tfvars 
terraform -chdir="dev/deployment/storage" apply -var-file=../../../terraform.tfvars -auto-approve
