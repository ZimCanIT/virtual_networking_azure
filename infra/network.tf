resource "azurerm_virtual_network" "az104_lab4_vnet" {
  name                = "${local.resource_prefix}vnet1"
  location            = azurerm_resource_group.az104_vnet_rg.location
  resource_group_name = azurerm_resource_group.az104_vnet_rg.name
  address_space       = ["10.40.0.0/20"]
}

resource "azurerm_subnet" "az104_lab4_subnet" {
  count                = length(local.subnet_ips)
  name                 = "Subnet${count.index}"
  virtual_network_name = azurerm_virtual_network.az104_lab4_vnet.name
  resource_group_name  = azurerm_resource_group.az104_vnet_rg.name
  # iterating over list of subnet ips
  address_prefixes = ["${local.subnet_ips[count.index]}"]
}

#-------------------------------------------------------------

# public ip address created for NICs
resource "azurerm_public_ip" "az104_lab4_public_ip" {
  count               = 2
  name                = "${local.resource_prefix}publicip${count.index}"
  location            = azurerm_resource_group.az104_vnet_rg.location
  resource_group_name = azurerm_resource_group.az104_vnet_rg.name
  # public IP Standard SKUs require allocation_method to be set to Static
  allocation_method = "Static"
  sku               = "Standard"
}

#-------------------------------------------------------------

# nics for vms
resource "azurerm_network_interface" "az104_lab4_nic" {
  count               = 2
  name                = "${local.resource_prefix}nic${count.index}"
  location            = azurerm_resource_group.az104_vnet_rg.location
  resource_group_name = azurerm_resource_group.az104_vnet_rg.name

  ip_configuration {
    name      = "internal"
    subnet_id = azurerm_subnet.az104_lab4_subnet[count.index].id
    # ip version to use
    private_ip_address_version = "IPv4"
    # dynamic assignment of a private IPv4 address
    private_ip_address_allocation = "Dynamic"
    # public ip to associate to each NIC e.g. public IP address of declared virtual machines 
    public_ip_address_id = azurerm_public_ip.az104_lab4_public_ip[count.index].id
  }
}


#-------------------------------------------------------------