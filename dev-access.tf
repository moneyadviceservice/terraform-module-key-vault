data "azuread_group" "service_team" {
  count = var.service_team_name != "" ? 1 : 0

  display_name     = var.service_team_name
  security_enabled = true
}

locals {
  service_team_object_id = var.service_team_name == "" ? var.service_team_object_id : data.azuread_group.service_team[0].object_id
}

resource "azurerm_key_vault_access_policy" "service_team_access" {
  key_vault_id = azurerm_key_vault.this.id

  object_id = local.service_team_object_id
  tenant_id = data.azurerm_client_config.current.tenant_id

  key_permissions = [
    "List",
    "Update",
    "Create",
    "Import",
    "Delete",
    "Recover",
  ]

  certificate_permissions = [
    "List",
    "Update",
    "Create",
    "Import",
    "Delete",
    "ManageContacts",
    "ManageIssuers",
    "GetIssuers",
    "ListIssuers",
    "SetIssuers",
    "DeleteIssuers",
    "Recover",
  ]

  secret_permissions = [
    "List",
    "Set",
    "Delete",
    "Recover",
  ]
}