#!/bin/bash sh

read -p 'folder name: ' dirname

echo "running terraform format"
terraform -chdir="./modules/$dirname" fmt
terraform -chdir="./deployment/$dirname" fmt
echo success!!!
echo running... terraform init $dirname
terraform -chdir="./deployment/$dirname" init  
echo success!!!
read -p 'run terraform plan : y or n => ' plan_ch
if [ "$plan_ch" = "y" ]
then 
    terraform -chdir="./deployment/$dirname" plan -var-file=../../terraform.tfvars 
    echo "\n\n\n"
    echo terraform -chdir="./deployment/$dirname" plan -var-file=../../terraform.tfvars 
    echo "\n\n\n"
    echo success!!!
else
    exit
fi
read -p 'run terraform apply : y or n => ' apply_ch
if [ "$apply_ch" = "y" ]
then
    echo "\n\n\n"
    terraform -chdir="./deployment/$dirname" apply -var-file=../../terraform.tfvars -auto-approve
    echo terraform -chdir="./deployment/$dirname" apply -var-file=../../terraform.tfvars -auto-approve
    echo "\n\n\n"
    echo success!!!
else
    exit
fi
echo "\n\n------------------------------------------------------\n\n"
echo terraform -chdir="./deployment/$dirname" init  
echo terraform -chdir="./deployment/$dirname" plan -var-file=../../terraform.tfvars 
echo terraform -chdir="./deployment/$dirname" apply -var-file=../../terraform.tfvars -auto-approve
echo terraform -chdir="./deployment/$dirname" destroy -var-file=../../terraform.tfvars -auto-approve

echo "\n\n------------------------------------------------------\n\n"
