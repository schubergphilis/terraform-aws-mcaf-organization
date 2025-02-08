output "roots" {
  value       = aws_organizations_organization.default.roots
  description = "List of organization roots."
}

output "accounts" {
  value       = aws_organizations_organization.default.accounts
  description = "List of organization accounts including the master account."
}

output "non_master_accounts" {
  value       = aws_organizations_organization.default.non_master_accounts
  description = "List of organization accounts excluding the master account."
}

output "arn" {
  value       = aws_organizations_organization.default.arn
  description = "ARN of the organization."
}

output "id" {
  value       = aws_organizations_organization.default.id
  description = "Identifier of the organization."
}
