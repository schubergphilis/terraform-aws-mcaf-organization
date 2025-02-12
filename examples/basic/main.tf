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

}
