# ADLS Gen2 Terraform (medallion)

This folder contains Terraform configuration to create an Azure Data Lake Storage Gen2 account and three blob containers representing a medallion architecture: `bronze`, `silver`, and `gold`.

Files:
- `versions.tf` - provider and Terraform version configuration
- `variables.tf` - configurable variables
- `main.tf` - resources (resource group, storage account, containers)
- `outputs.tf` - useful outputs

Quick start
1. Ensure you have the following environment variables set for Azure authentication (Service Principal recommended):

```bash
export ARM_CLIENT_ID="..."
export ARM_CLIENT_SECRET="..."
export ARM_SUBSCRIPTION_ID="..."
export ARM_TENANT_ID="..."
```

2. Initialize and apply:

```bash
cd infra/azure/adls
terraform init
terraform apply -auto-approve
```

3. After apply, the outputs will show the storage account and container ids.

Notes and assumptions
- The storage account name is built from `storage_account_name_prefix` plus a short random suffix to ensure uniqueness. The combined name is truncated to 24 characters to satisfy Azure restrictions.
- `is_hns_enabled = true` enables hierarchical namespace (ADLS Gen2).
- Containers are created as private (no public access).
- If your CI/CD environment disallows Service Principal env vars, configure the provider auth using managed identity or pipeline service connections.

Next improvements (optional):
- Add lifecycle management rules per medallion tier (e.g., move older bronze data to archive)
- Add RBAC role assignments for access control
- Add storage logging and diagnostic settings
