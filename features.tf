resource "aws_iam_organizations_features" "default" {
  count = length(var.enabled_features) > 0 ? 1 : 0

  enabled_features = var.enabled_features

  depends_on = [aws_organizations_organization.default]
}
