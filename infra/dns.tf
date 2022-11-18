# configure Azure DNS for internal name resolution - task 5 
resource "azurerm_private_dns_zone" "az104_lab4_private_dns_zone" {
  name                = "contoso.org"
  resource_group_name = azurerm_resource_group.az104_vnet_rg.name
}

# manage Private DNS zone Virtual Network Links \n
# enable DNS resolution and registration inside Azure Virtual Networks using Azure Private DNS
resource "azurerm_private_dns_zone_virtual_network_link" "az104_lab4_private_dns_vnet_link" {
  name                  = "${local.resource_prefix}vnet-link"
  resource_group_name   = azurerm_resource_group.az104_vnet_rg.name
  private_dns_zone_name = azurerm_private_dns_zone.az104_lab4_private_dns_zone.name
  virtual_network_id    = azurerm_virtual_network.az104_lab4_vnet.id
  # enabling auto-registration of vms in the designate vnet 
  registration_enabled = true
}

#-------------------------------------------------------------

# configure Azure DNS for internal name resolution - task 6
# godaddy wasn't loading, used goggle's domain registrat top search for a domian:@ https://domains.google.com/registrar/ 
# available dns name zimcanit.training.com

resource "azurerm_dns_zone" "az104_lab4_public_dns_zone" {
  name                = "zimcanit.training.com"
  resource_group_name = azurerm_resource_group.az104_vnet_rg.name
}

# DNS A Records for virtual machines
resource "azurerm_dns_a_record" "az104_lab4_a_record" {
  count               = 2
  name                = "${local.resource_prefix}vm${count.index}"
  zone_name           = azurerm_dns_zone.az104_lab4_public_dns_zone.name
  resource_group_name = azurerm_resource_group.az104_vnet_rg.name
  # ttl of dns record in seconds (3600 seconds == 1 hour)
  ttl = 3600
  # liat of IPv4 addresses to associate with a record (pointin to public ip of vms)
  # primary IPv4 address assigned to vm 
  records = [azurerm_windows_virtual_machine.az104_lab4_vms[count.index].public_ip_address]
}

#-------------------------------------------------------------