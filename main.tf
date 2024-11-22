data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "this" {
  name                        = var.name == "" ? "${var.product}-${var.env}" : var.name
  location                    = var.location
  resource_group_name         = var.resource_group_name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 90
  purge_protection_enabled    = var.purge_protection_enabled

  sku_name = var.sku

  network_acls {
    bypass                     = "AzureServices"
    default_action             = var.network_acls_default_action
    ip_rules                   = var.network_acls_ip_rules
    virtual_network_subnet_ids = var.network_acls_allowed_subnet_ids
  }
}

resource "azurerm_key_vault_access_policy" "agent_access" {
  key_vault_id = azurerm_key_vault.this.id

  object_id = data.azurerm_client_config.current.object_id
  tenant_id = data.azurerm_client_config.current.tenant_id

  certificate_permissions = [
    "Create",
    "Delete",
    "DeleteIssuers",
    "Get",
    "GetIssuers",
    "Import",
    "List",
    "ListIssuers",
    "SetIssuers",
    "Update",
    "ManageContacts",
    "ManageIssuers",
  ]

  key_permissions = [
    "Create",
    "List",
    "Get",
    "Delete",
    "Update",
    "Import",
    "Backup",
    "Restore",
    "Decrypt",
    "Encrypt",
    "UnwrapKey",
    "WrapKey",
    "Sign",
    "Verify",
    "GetRotationPolicy",
  ]

  secret_permissions = [
    "Set",
    "List",
    "Get",
    "Delete",
    "Recover",
    "Purge",
  ]
}