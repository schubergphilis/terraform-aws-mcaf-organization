# terraform-aws-mcaf-organization

Terraform module to manage an AWS Organization.

## Features

- **Centralized Root Access:** Automatically enables centralized root access for member accounts. For more details, see the [AWS Documentation](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_root-enable-root-access.html).
- **Full Organization Features:** Activates all Organization features and policy types by default.
- **Recommended AWS Service Access Principals:**  Comes with an out-of-the-box configuration for recommended AWS service access principals to ensure seamless integration with essential AWS services.

> [!NOTE]
> This module is designed to work in an environment where AWS Control Tower is enabled. Since AWS Control Tower creates the AWS Organization, you must perform an import of the existing organization into Terraform on the first deployment. This ensures that the module can manage the organization without recreating resources that are already managed by AWS Control Tower.

## Usage

> [!IMPORTANT]
> We do not pin modules to versions in our examples. We highly recommend that in your code you pin the version to the exact version you are using so that your infrastructure remains stable.

```hcl
module "organization" {
    source  = "schubergphilis/mcaf-organization/aws"
}
```

## Importing an existing organisation

In order to import an existing AWS Organization, add the following to your codebase when first using this module.

HCL:

```hcl
data "aws_organizations_organization" "default" {}

import {
  id = data.aws_organizations_organization.default.id
  to = module.organization.aws_organizations_organization.default
}
```

Or in Python CDKTF:

```python
data_aws_organizations = DataAwsOrganizationsOrganization(self, 'data_aws_organizations')

self.add_override("import", {
    "id": data_aws_organizations.id,
    "to": "module.mcaforg.aws_organizations_organization.default"
})
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.6 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.78.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 5.78.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_organizations_features.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_organizations_features) | resource |
| [aws_organizations_organization.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_organization) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_service_access_principals"></a> [aws\_service\_access\_principals](#input\_aws\_service\_access\_principals) | List of AWS service principal names for which you want to enable integration with your organization. | `list(string)` | <pre>[<br/>  "account.amazonaws.com",<br/>  "auditmanager.amazonaws.com",<br/>  "backup.amazonaws.com",<br/>  "cloudtrail.amazonaws.com",<br/>  "compute-optimizer.amazonaws.com",<br/>  "config-multiaccountsetup.amazonaws.com",<br/>  "config.amazonaws.com",<br/>  "controltower.amazonaws.com",<br/>  "guardduty.amazonaws.com",<br/>  "health.amazonaws.com",<br/>  "iam.amazonaws.com",<br/>  "inspector2.amazonaws.com",<br/>  "ipam.amazonaws.com",<br/>  "malware-protection.guardduty.amazonaws.com",<br/>  "ram.amazonaws.com",<br/>  "reporting.trustedadvisor.amazonaws.com",<br/>  "securityhub.amazonaws.com",<br/>  "sso.amazonaws.com",<br/>  "tagpolicies.tag.amazonaws.com"<br/>]</pre> | no |
| <a name="input_enabled_features"></a> [enabled\_features](#input\_enabled\_features) | List of IAM features to enable. | `list(string)` | <pre>[<br/>  "RootCredentialsManagement",<br/>  "RootSessions"<br/>]</pre> | no |
| <a name="input_enabled_policy_types"></a> [enabled\_policy\_types](#input\_enabled\_policy\_types) | List of Organizations policy types to enable in the Organization Root. | `list(string)` | <pre>[<br/>  "AISERVICES_OPT_OUT_POLICY",<br/>  "BACKUP_POLICY",<br/>  "SERVICE_CONTROL_POLICY",<br/>  "TAG_POLICY"<br/>]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_accounts"></a> [accounts](#output\_accounts) | List of organization accounts including the master account. |
| <a name="output_arn"></a> [arn](#output\_arn) | ARN of the organization. |
| <a name="output_id"></a> [id](#output\_id) | Identifier of the organization. |
| <a name="output_non_master_accounts"></a> [non\_master\_accounts](#output\_non\_master\_accounts) | List of organization accounts excluding the master account. |
| <a name="output_roots"></a> [roots](#output\_roots) | List of organization roots. |
<!-- END_TF_DOCS -->
