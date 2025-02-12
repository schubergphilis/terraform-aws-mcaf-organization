provider "aws" {
  region = "eu-central-1"
}

module "organization" {
  source = "../../"

  enabled_features = []
  aws_service_access_principals = [
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
}
data "aws_organizations_organization" "default" {}

import {
  id = data.aws_organizations_organization.default.id
  to = module.organization.aws_organizations_organization.default
}
