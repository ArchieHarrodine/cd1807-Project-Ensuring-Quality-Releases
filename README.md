# Project Starter
This repository contains the starter code for the **Ensuring Quality Releases** project of the cd1807 Ensuring Quality Releases (Quality Assurance) course taught by Nathan Anderson. 


## How to use?
- Fork this repository to your Github account and clone it locally for further development. 
- Follow the classroom instructions, and check the rubric before a submission. 

1. update terraform.tf vars file: subscription id, tenant id, client id (application id), client secret (secret key)
2. update terraform.tf vars file: resource group name (Azuredevops), location = `az group show --name Azuredevops --query location -o tsv`, application name (myApplication)  
3. ```
cd terraform/environments/test 
chmod +x configure-tfstate-storage-account.sh
./configure-tfstate-storage-account.sh
```
returns:
```
RESOURCE_GROUP_NAME=Azuredevops
STORAGE_ACCOUNT_NAME=<storage_name>
CONTAINER_NAME=tfstate
ACCOUNT_KEY=<storage_key>
```
4. Add details to main.tf:
```
terraform {
  backend "azurerm" {
    storage_account_name = "<storage_name>"
    container_name       = "tfstate" 
    key                  = "test.terraform.tfstate"
    access_key           = "<storage_key>"
  }
}
```
5. run: ssh-keygen -t rsa -b 4096  , make a note of the file path
6. Add this ti main.tf:
```
module "vm" {
  source              = "../../modules/vm"
  vm_name             = "myvm01"                
  location            = var.location     
  resource_group_name = module.resource_group.resource_group_name
  subnet_id           = module.network.subnet_id_test
  public_ip_id        = module.publicip.public_ip_address_id
  vm_size             = "Standard_DS2_v2"
  admin_username      = "azureuser"
  ssh_public_key_path = "<rsa.pub file path from main.tf>"
}
```
Note: update resource group module 
7. inside terraform/environments/test, run
```
terraform init
terraform validate
terraform plan -out=tfplan
terraform apply "tfplan"
```

## Suggestions and Corrections
Feel free to submit PRs to this repo should you have any proposed changes. 
