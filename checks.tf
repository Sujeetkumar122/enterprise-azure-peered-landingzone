# ==============================================================================
# Enterprise Security Guardrails (100% Pure HCL)
# ==============================================================================

# Guardrail 1: Enforce TLS 1.2 on storage accounts
check "enforce_storage_tls" {
  assert {
    condition = alltrue([
      for k, v in var.storage_accounts : v.min_tls_version == "TLS1_2"
    ])
    error_message = "Enterprise Policy: All storage accounts must enforce TLS 1.2 minimum version."
  }
}

# Guardrail 2: Enforce AzureBastionSubnet prefix compliance (/26 or /27 required)
check "enforce_bastion_subnet" {
  assert {
    condition = alltrue([
      for k, v in var.subnets : (
        v.name == "AzureBastionSubnet" ? can(regex("/(26|27)$", v.prefix)) : true
      )
    ])
    error_message = "Enterprise Policy: AzureBastionSubnet must have a CIDR of /26 or /27."
  }
}

# Guardrail 3: Enforce Standard SKU for Bastion Public IPs
check "enforce_bastion_pip_sku" {
  assert {
    condition = alltrue([
      for k, v in var.public_ips : v.sku == "Standard"
    ])
    error_message = "Enterprise Policy: All public IPs for Bastion must use the Standard SKU."
  }
}
