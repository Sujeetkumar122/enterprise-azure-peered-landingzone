# Enterprise Azure Multi-Environment Landing Zone (Terraform)

Production-grade, modular enterprise Azure infrastructure with clear separation of **Reusable Modules** and **Environment Deployments** (`environments/dev` and `environments/prod`), deploying dual peered networks, Azure Bastion jump-hosts, Linux VMs, NSGs, and TLS 1.2 Storage Accounts.

## 🏗️ Architecture & Directory Topology

```
enterprise-azure-peered-landingzone/
├── .gitignore
├── .tflint.hcl                                  # TFLint HCL config & Azure ruleset
├── README.md
│
├── modules/                                     # Reusable Child Modules
│   ├── azurerm_resource_group/                 # RG module
│   ├── azurerm_virtual_network/                # VNet module
│   ├── azurerm_subnet/                         # Subnets (including AzureBastionSubnet)
│   ├── azurerm_network_security_group/         # NSG module
│   ├── azurerm_virtual_network_peering/        # Bi-directional Peering module
│   ├── azurerm_public_ip/                      # Standard Static PIP module
│   ├── azurerm_network_interface/              # VM NIC module
│   ├── azurerm_bastion_host/                   # Azure Bastion module
│   ├── azurerm_virtual_machine/                # Linux VM compute module
│   └── azurerm_storage_account/                # Storage module (TLS 1.2)
│
└── environments/                                # Environment Deployments
    ├── dev/                                     # Development Environment
    │   ├── provider.tf
    │   ├── main.tf                              # Calls ../../modules/ for Dev
    │   ├── variables.tf
    │   ├── outputs.tf
    │   ├── checks.tf                            # Pure HCL native security checks
    │   └── terraform.tfvars                     # Dev environment values
    │
    └── prod/                                    # Production Environment
        ├── provider.tf
        ├── main.tf                              # Calls ../../modules/ for Prod
        ├── variables.tf
        ├── outputs.tf
        ├── checks.tf                            # Pure HCL native security checks
        └── terraform.tfvars                     # Prod environment values
```

## 🚀 How to Deploy an Environment

### 1. Deploy Development:
```bash
cd environments/dev
terraform init
terraform plan
terraform apply
```

### 2. Deploy Production:
```bash
cd environments/prod
terraform init
terraform plan
terraform apply
```

## 🛡️ Enterprise Quality Standards
- **Modular & Environment Separation**: Strictly separates generic child modules (`modules/`) from environment deployments (`environments/dev`, `environments/prod`).
- **100% Pure HCL**: No shell scripts; all security policies run natively via Terraform `check` blocks.
- **Zero Dummy Data**: Dynamic module references provide real IDs with zero fake `/subscriptions/xxxx/` strings.
- **Validated**: Code passes `terraform fmt`, `terraform validate`, and `tflint` (0 violations).
