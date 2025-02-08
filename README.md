# terraform-aws-mcaf-organization
Terraform module to manage an AWS Organization.

This module enables centralize root access for member accounts by default. ([AWS Documentation](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_root-enable-root-access.html))


By default, the module enables all Organization features and policy types, for a common set of principles. 

```hcl
module "organization" {
  source = "github.com/schubergphilis/terraform-aws-mcaf-organization"
}
```

## Importing an existing organisation
In order to import an existing AWS Organization, add the following to your codebase when first using this module.

```hcl
data "aws_organizations_organization" "default" {}

import {
  id = data.aws_organizations_organization.default.id
  to = module.organization.aws_organizations_organization.default
}
```
Or in Python cdktf

```python
self.add_override("moved", {
    "from": "aws_organizations_organization.aws_org",
    "to": "module.mcaforg.aws_organizations_organization.default"
})
```
