variable "vm_name" {}
variable "location" {}
variable "resource_group_name" {}
variable "subnet_id" {}
variable "public_ip_id" {}
variable "vm_size" { default = "Standard_DS2_v2" }
variable "admin_username" { default = "azureuser" }
variable "admin_password" {}
variable "ssh_public_key_path" { default = "~/.ssh/id_rsa.pub" }