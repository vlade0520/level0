output "storage_account_name" {
  value = azurerm_storage_account.stg.name
}

output "container" {
  value = azurerm_storage_container.launchpad.name
}

output "resource_groups" {
  value = {
    "tfstate"   = azurerm_resource_group.rg_tfstate.name
    "security"  = azurerm_resource_group.rg_security.name
    "network"   = azurerm_resource_group.rg_network.name
    "devops"       = azurerm_resource_group.rg_devops.name
  }
}


output "prefix" {
  value = random_string.prefix.result
}


output "tfstate_map" {
  value = map(
    "storage_account_name", azurerm_storage_account.stg.name,
    "container", azurerm_storage_container.launchpad.name,
    "resource_group", azurerm_resource_group.rg_tfstate.name,
    "prefix", random_string.prefix.result
  )
}

# output "deployment_msi" {
#   value = map(
#     "id", azurerm_user_assigned_identity.tfstate.id,
#     "principal_id", azurerm_user_assigned_identity.tfstate.principal_id,
#     "client_id", azurerm_user_assigned_identity.tfstate.client_id
#   )
# }

output "keyvault_id" {
  value = azurerm_key_vault.launchpad.id
}

output "launchpad_application_id" {
  value = azuread_service_principal.launchpad.application_id
  sensitive = true
}

output "devops_client_secret" {
  value = random_password.launchpad.result
  sensitive = true
}

output "tfstate-blob-name" {
  value = local.launchpad-blob-name
}

output "log_analytics" {
  value = module.log_analytics
  sensitive = true
}

output "diagnostics" {
  value = module.diagnostics
  sensitive = true
}

output "vnet" {
  value = module.blueprint_networking.vnet
}