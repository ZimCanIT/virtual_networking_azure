resource "azurerm_windows_virtual_machine" "az104_lab4_vms" {
  count               = 2
  name                = "${local.resource_prefix}vm${count.index}"
  location            = azurerm_resource_group.az104_vnet_rg.location
  resource_group_name = azurerm_resource_group.az104_vnet_rg.name

  # general purpose vm of standard SKU 
  # https://learn.microsoft.com/en-us/azure/virtual-machines/sizes-b-series-burstable
  # will upgrade vm series type after service quota increase request in West Europe region for vm vCpus is aproved: \n
  # https://blogs.sap.com/2017/03/16/how-to-increase-the-quota-for-your-subscription-in-microsoft-azure-portal/
  # capacity:  2 vCPU + 4 GiB memory
  size           = "Standard_B2s"
  admin_username = "zimcanit-admin"
  admin_password = var.vm_pwd

  network_interface_ids = [
    azurerm_network_interface.az104_lab4_nic["${count.index}"].id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }
}

#-------------------------------------------------------------
