resource "aws_organizations_organization" "default" {
  aws_service_access_principals = var.aws_service_access_principals
  enabled_policy_types          = var.enabled_policy_types
  feature_set                   = "ALL"
}

resource "aws_organizations_delegated_administrator" "delegated_admin" {
  for_each = { for admin in var.delegated_admins : "${admin.account_id}-${admin.service_principal}" => admin }

  account_id        = each.value.account_id
  service_principal = each.value.service_principal
}

resource "aws_organizations_resource_policy" "resource_policy" {
  count = var.organizations_resource_policy != null ? 1 : 0

  content = var.organizations_resource_policy
}
