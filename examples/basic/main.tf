provider "aws" {
  region = "eu-central-1"
}

data "aws_organizations_organization" "default" {}

import {
  id = data.aws_organizations_organization.default.id
  to = module.organization.aws_organizations_organization.default
}

module "organization" {
  source = "../../"

  delegated_admins = [
    {
      account_id        = "111111111111"
      service_principal = "backup.amazonaws.com"
    },
    {
      account_id        = "222222222222"
      service_principal = "guardduty.amazonaws.com"
    }
  ]
}
