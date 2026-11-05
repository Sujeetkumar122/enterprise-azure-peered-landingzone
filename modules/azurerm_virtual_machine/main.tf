resource "azurerm_linux_virtual_machine" "vm" {
  for_each = var.virtual_machines

  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  size                = each.value.size

  admin_username                  = each.value.admin_username
  admin_password                  = each.value.admin_password
  disable_password_authentication = false

  network_interface_ids = [
    each.value.network_interface_id
  ]

  os_disk {
    caching              = try(each.value.os_disk_caching, "ReadWrite")
    storage_account_type = try(each.value.storage_account_type, "Standard_LRS")
  }

  source_image_reference {
    publisher = try(each.value.image_publisher, "Canonical")
    offer     = try(each.value.image_offer, "0001-com-ubuntu-server-jammy")
    sku       = try(each.value.image_sku, "22_04-lts")
    version   = try(each.value.image_version, "latest")
  }

  tags = try(each.value.tags, {})
}
