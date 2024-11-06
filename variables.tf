variable "name" {
  type        = string
  description = "The name of your Key Vault"
}

variable "env" {
  type        = string
  description = "The environment to deploy to"
}

variable "location" {
  type    = string
  default = "uksouth"
}

variable "resource_group_name" {
  type        = string
  description = "The resource group your Key Vault will be assigned to"
}

variable "product" {
  type        = string
  description = "The product name"
}

variable "purge_protection_enabled" {
  default = true
}

variable "sku" {
  default     = "standard"
  description = "The Name of the SKU used for this Key Vault. Possible values are standard and premium."
}

variable "network_acls_default_action" {
  description = "(Required) The Default Action to use when no rules match from ip_rules / virtual_network_subnet_ids. Possible values are Allow and Deny."
  default     = "Allow"
}

variable "network_acls_ip_rules" {
  description = "(Optional) One or more IP Addresses, or CIDR Blocks which should be able to access the Key Vault."
  type        = list(string)
  default     = []
}

variable "network_acls_allowed_subnet_ids" {
  description = "(Optional) One or more Subnet IDs which should be able to access this Key Vault."
  type        = list(string)
  default     = []
}

variable "service_team_name" {
  description = "The name of the Service Team e.g. MHPD"
  type        = string
}

variable "service_team_object_id" {
  description = "The Entra object id for the Service Team"
  type        = string
  default     = ""
}