variable "resource_group_name" {
  description = "Name of the resource group to create"
  type        = string
  default     = "rg-datalake"
}

variable "location" {
  description = "Azure location for resources"
  type        = string
  default     = "eastus"
}

variable "storage_account_name_prefix" {
  description = "Prefix used for the storage account name (must be lowercase, 3-11 chars recommended)"
  type        = string
  default     = "datalakesa"
}

variable "environment" {
  description = "Environment tag for resources"
  type        = string
  default     = "dev"
}

variable "sku_name" {
  description = "Storage account SKU"
  type        = string
  default     = "Standard_LRS"
}

variable "client_id" {
  description = "(Optional) Service Principal client id. If empty, provider will use other auth methods (env vars, managed identity, Azure CLI)."
  type        = string
  default     = ""
}

variable "client_secret" {
  description = "(Optional) Service Principal client secret. If empty, provider will use other auth methods."
  type        = string
  default     = ""
  sensitive   = true
}

variable "subscription_id" {
  description = "(Optional) Azure subscription id. If empty, provider will use other auth methods."
  type        = string
  default     = ""
}

variable "tenant_id" {
  description = "(Optional) Azure tenant id. If empty, provider will use other auth methods."
  type        = string
  default     = ""
}
