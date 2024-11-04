# terraform-module-key-vault
A Terraform module for the creation of Azure [Key Vaults](https://learn.microsoft.com/en-us/azure/key-vault/general/overview)

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_key_vault.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault) | resource |
| [azurerm_client_config.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/client_config) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_env"></a> [env](#input\_env) | The environment to deploy to | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | n/a | `string` | `"uksouth"` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of your Key Vault | `string` | n/a | yes |
| <a name="input_network_acls_allowed_subnet_ids"></a> [network\_acls\_allowed\_subnet\_ids](#input\_network\_acls\_allowed\_subnet\_ids) | (Optional) One or more Subnet IDs which should be able to access this Key Vault. | `list(string)` | `[]` | no |
| <a name="input_network_acls_default_action"></a> [network\_acls\_default\_action](#input\_network\_acls\_default\_action) | (Required) The Default Action to use when no rules match from ip\_rules / virtual\_network\_subnet\_ids. Possible values are Allow and Deny. | `string` | `"Allow"` | no |
| <a name="input_network_acls_ip_rules"></a> [network\_acls\_ip\_rules](#input\_network\_acls\_ip\_rules) | (Optional) One or more IP Addresses, or CIDR Blocks which should be able to access the Key Vault. | `list(string)` | `[]` | no |
| <a name="input_product"></a> [product](#input\_product) | The product name | `string` | n/a | yes |
| <a name="input_purge_protection_enabled"></a> [purge\_protection\_enabled](#input\_purge\_protection\_enabled) | n/a | `bool` | `true` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The resource group your Key Vault will be assigned to | `string` | n/a | yes |
| <a name="input_sku"></a> [sku](#input\_sku) | The Name of the SKU used for this Key Vault. Possible values are standard and premium. | `string` | `"standard"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_key_vault_id"></a> [key\_vault\_id](#output\_key\_vault\_id) | n/a |
| <a name="output_key_vault_name"></a> [key\_vault\_name](#output\_key\_vault\_name) | n/a |
| <a name="output_key_vault_uri"></a> [key\_vault\_uri](#output\_key\_vault\_uri) | n/a |
<!-- END_TF_DOCS -->