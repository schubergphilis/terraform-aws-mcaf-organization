provider "aws" {
  region = "eu-central-1"
}

module "organization" {
  # source = "github.com/schubergphilis/terraform-aws-mcaf-organization?ref=add_organizations_features"
  source = "../../"

  enabled_features = []
  aws_service_access_principals = ["auditmanager.amazonaws.com",
    "backup.amazonaws.com",
    "cloudtrail.amazonaws.com",
    "config-multiaccountsetup.amazonaws.com",
    "config.amazonaws.com",
    "controltower.amazonaws.com",
    "cost-optimization-hub.bcm.amazonaws.com",
    "fms.amazonaws.com",
    "guardduty.amazonaws.com",
    "health.amazonaws.com",
    "inspector2.amazonaws.com",
    "ipam.amazonaws.com",
    "license-management.marketplace.amazonaws.com",
    "license-manager-linux-subscriptions.amazonaws.com",
    "license-manager.amazonaws.com",
    "license-manager.member-account.amazonaws.com",
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
