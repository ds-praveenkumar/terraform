#!/bin/bash

read -p 'folder name: ' dirname

echo running... terraform init $dirname
terraform -chdir="./deployment/$dirname" init  
echo success!!!
read -p 'run terraform plan : y or n ' plan_ch
if [ "$plan_ch" = "y" ]
then 
    terraform -chdir="./deployment/$dirname" plan -var-file=../../terraform.tfvars 
    echo success!!!
else
    exit
fi
read -p 'run terraform apply : y or n ' apply_ch
if [ "$apply_ch" = "y" ]
then
    terraform -chdir="./deployment/$dirname" apply -var-file=../../terraform.tfvars -auto-approve
    echo success!!!
else
    exit
fi
