
# netowrk security group
resource "azurerm_network_security_group" "az104_lab4_nsg" {
  name                = "${local.resource_prefix}nsg01"
  location            = azurerm_resource_group.az104_vnet_rg.location
  resource_group_name = azurerm_resource_group.az104_vnet_rg.name
}

#-------------------------------------------------------------

# inbound network security group rule 
resource "azurerm_network_security_rule" "az104_lab4_nsg_inbound_rule" {
  name                        = "AllowRDPInBound"
  priority                    = 300
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "3389"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.az104_vnet_rg.name
  network_security_group_name = azurerm_network_security_group.az104_lab4_nsg.name
}

#-------------------------------------------------------------

# associating nsg with subnet
resource "azurerm_subnet_network_security_group_association" "az104_lab4_nsg_association" {
  count                     = 2
  subnet_id                 = azurerm_subnet.az104_lab4_subnet[count.index].id
  network_security_group_id = azurerm_network_security_group.az104_lab4_nsg.id
}

#-------------------------------------------------------------