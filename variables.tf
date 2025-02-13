variable "aws_service_access_principals" {
  type     = list(string)
  nullable = false
  default = [
    "account.amazonaws.com",
    "auditmanager.amazonaws.com",
    "backup.amazonaws.com",
    "cloudtrail.amazonaws.com",
    "compute-optimizer.amazonaws.com",
    "config-multiaccountsetup.amazonaws.com",
    "config.amazonaws.com",
    "controltower.amazonaws.com",
    "guardduty.amazonaws.com",
    "health.amazonaws.com",
    "iam.amazonaws.com",
    "inspector2.amazonaws.com",
    "ipam.amazonaws.com",
    "malware-protection.guardduty.amazonaws.com",
    "ram.amazonaws.com",
    "reporting.trustedadvisor.amazonaws.com",
    "securityhub.amazonaws.com",
    "sso.amazonaws.com",
    "tagpolicies.tag.amazonaws.com",
  ]
  description = "List of AWS service principal names for which you want to enable integration with your organization."

  validation {
    condition = length(setintersection(
      var.aws_service_access_principals,
      [
        "account.amazonaws.com",
        "cloudtrail.amazonaws.com",
        "config-multiaccountsetup.amazonaws.com",
        "config.amazonaws.com",
        "controltower.amazonaws.com",
        "iam.amazonaws.com",
        "securityhub.amazonaws.com",
        "sso.amazonaws.com",
      ]
    )) == 8

    error_message = <<EOT
aws_service_access_principals must contain at least the following AWS service access principals:
- "account.amazonaws.com"
- "cloudtrail.amazonaws.com"
- "config-multiaccountsetup.amazonaws.com"
- "config.amazonaws.com"
- "controltower.amazonaws.com"
- "iam.amazonaws.com"
- "securityhub.amazonaws.com"
- "sso.amazonaws.com"
EOT
  }
}

variable "enabled_policy_types" {
  type        = list(string)
  nullable    = false
  default     = ["BACKUP_POLICY", "SERVICE_CONTROL_POLICY", "TAG_POLICY"]
  description = "List of Organizations policy types to enable in the Organization Root."
}

variable "enabled_features" {
  type     = list(string)
  nullable = false
  default = [
    "RootCredentialsManagement",
    "RootSessions"
  ]
  description = "List of IAM features to enable."
}
