module "role" {
  count = var.execution_role_arn == null ? 1 : 0

  source = "github.com/pbs/terraform-aws-iam-role-module?ref=0.2.1"

  name = local.execution_role_name

  policy_json = local.aggregate_policy

  # Tagging Parameters
  organization = var.organization
  environment  = var.environment
  product      = var.product
  repo         = var.repo

  # Optional Parameters
  aws_services = ["lambda"]
}
