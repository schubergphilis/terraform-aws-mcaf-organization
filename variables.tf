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
}

variable "enabled_policy_types" {
  type     = list(string)
  nullable = false
  default  = ["BACKUP_POLICY", "SERVICE_CONTROL_POLICY", "TAG_POLICY"]
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
