

resource "azurerm_resource_group" "rg" {
  name     = "${var.tenant_name}-rg"
  location = var.resource_group_location
}

module "network" {
  source = "github.com/gopal1409/terraform-module-ken6/modules/vnet"

  tenant_name = var.tenant_name
  subnet_name = var.my_subnet_name
  resource_group_location = var.resource_group_location
  resource_group_name = azurerm_resource_group.rg.name 
}

module "vm-windows-10" {
  source = "github.com/gopal1409/terraform-module-ken6/modules/vm"

  my_virtual_machine_name = var.my_virtual_machine_name_win10
  my_virtual_machine_password = var.my_virtual_machine_password_win10
  my_virtual_machine_size = var.my_virtual_machine_size
  location = var.resource_group_location
  resource_group_name = azurerm_resource_group.rg.name
  azurerm_subnet_id = module.network.azurerm_subnet_id
  source_image_offer = var.source_image_offer_win10
  source_image_sku = var.source_image_sku_win10
  network_interface_name = var.network_interface_name_win10
  public_ip_address_name = var.public_ip_address_name_win10
}
