#how to create a resource group. 
/*resource "azurerm_resource_group" "myrg" { #this is the refrence it will be managed by terraform to store your logs
  name = "${local.resource_name_prefix}-${var.resource_group_name}"
  #sap-dev-rg-default
  location = var.resource_group_location
  tags     = local.common_tags
}*/
data "azurerm_resource_group" "myrg1" {
  name = data.azurerm_resource_group.myrg.name
  location  = data.azurerm_resource_group.myrg.location
  
}

module "vnet" {
  source = "github.com/gopal1409/terraform-module-ken6/modules/vnet"
  business_devision = "sap"
environment = "stage"
resource_group_name = "rg-default"
resource_group_location = "eastus"
vnet_name = "vnet"
vnet_address_space =  ["10.1.0.0/16"]
web_subnet_name = "websubnet"
web_subnet_address = ["10.1.1.0/24"]
}
