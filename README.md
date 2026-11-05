# Enterprise Azure Network & Compute Foundation (Terraform)

Production-ready, multi-environment Azure landing zone deploying a dual peered network architecture (Dev & Prod) with Azure Bastion Jump-Hosts, Hardened Linux Virtual Machines, Network Security Groups, and Storage Accounts.

## 🏗️ Architecture & Topology

- **Dual Peered Environments**:
  - `vnet-dev` (`10.0.0.0/16`) in `rg-dev`
  - `vnet-prod` (`10.1.0.0/16`) in `rg-prod`
- **Bi-directional VNet Peering**: Low-latency mesh connection between Dev and Prod networks.
- **Secure Management & Jump Host Access**: Azure Bastion deployed in both environments with dedicated `AzureBastionSubnet` (/26 prefix) and Standard static Public IPs.
- **Compute Tier**: Linux VMs (`Standard_B1s`) attached to dedicated Network Interfaces with dynamic internal IP allocation.
- **Micro-Segmentation**: Network Security Groups (`web-nsg` and `app-nsg`) controlling ingress and egress traffic.
- **Secure Storage**: Storage accounts with enforced TLS 1.2 minimum encryption standards.

## 📦 Directory Structure

```
enterprise-azure-network-compute-foundation/
├── .gitignore
├── .tflint.hcl                                  # TFLint pure HCL configuration
├── checks.tf                                    # Native HCL security assertions
├── provider.tf                                  # Azurerm provider specification
├── main.tf                                      # Root orchestration module
├── variables.tf                                 # Strongly typed HCL map variables
├── outputs.tf                                   # Deployed resource outputs
├── terraform.tfvars                             # Environment deployment configuration
├── terraform.tfvars.example                     # Reference template
└── modules/
    ├── azurerm_resource_group/                 # RG module
    ├── azurerm_virtual_network/                # VNet module
    ├── azurerm_subnet/                         # Subnet module
    ├── azurerm_network_security_group/         # NSG module
    ├── azurerm_virtual_network_peering/        # Bi-directional peering module
    ├── azurerm_public_ip/                      # Standard Static PIP module
    ├── azurerm_network_interface/              # VM NIC module
    ├── azurerm_bastion_host/                   # Azure Bastion module
    ├── azurerm_virtual_machine/                # Linux VM compute module
    └── azurerm_storage_account/                # Storage module (TLS 1.2)
```

## 🛡️ Enterprise Quality Standards
- **100% Pure HCL**: No shell or powershell scripts used; all validations and security guardrails run natively in HCL.
- **Zero Dummy Data**: Dynamic output referencing completely eliminates dummy subscription strings (`/subscriptions/xxxx/...`).
- **Linted & Validated**: Passes `terraform fmt`, `terraform validate`, and `tflint`.
