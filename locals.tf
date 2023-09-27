locals {
  name = var.name != null ? var.name : var.product

  execution_role_arn = var.execution_role_arn != null ? var.execution_role_arn : module.role[0].arn

  artifact_s3_location = "s3://${module.s3.name}/"

  creator = "terraform"

  defaulted_tags = merge(
    var.tags,
    {
      Name                                        = local.name
      "${var.organization}:billing:owner"         = var.owner
      "${var.organization}:billing:product"       = var.product
      "${var.organization}:billing:environment"   = var.environment
      creator                                     = local.creator
      repo                                        = var.repo
    }
  )

  tags = merge({ for k, v in local.defaulted_tags : k => v if lookup(data.aws_default_tags.common_tags.tags, k, "") != v })
}

data "aws_default_tags" "common_tags" {}
