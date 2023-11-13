locals {
  name = var.name != null ? var.name : var.product

  # Snapshot Bucket
  default_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Action" : [
          "s3:PutObject",
          "s3:GetObject"
        ],
        "Resource" : [
          "${module.s3.arn}/*"
        ]
      },
      {
        "Effect" : "Allow",
        "Action" : [
          "s3:GetBucketLocation"
        ],
        "Resource" : [
          module.s3.arn
        ]
      },
      {
        "Effect" : "Allow",
        "Action" : [
          "logs:CreateLogStream",
          "logs:PutLogEvents",
          "logs:CreateLogGroup"
        ],
        "Resource" : [
          "arn:aws:logs:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:log-group:/aws/lambda/cwsyn-${local.name}*"
        ]
      },
      {
        "Effect" : "Allow",
        "Action" : [
          "s3:ListAllMyBuckets",
          "xray:PutTraceSegments"
        ],
        "Resource" : [
          "*"
        ]
      },
      {
        "Effect" : "Allow",
        "Resource" : "*",
        "Action" : "cloudwatch:PutMetricData",
        "Condition" : {
          "StringEquals" : {
            "cloudwatch:namespace" : "CloudWatchSynthetics"
          }
        }
      }
    ]
  })

  aggregate_policy = var.role_policy != null ? (var.cumulative_policy ? merge(local.default_policy, var.role_policy) : var.role_policy) : local.default_policy

  execution_role_arn = var.execution_role_arn != null ? var.execution_role_arn : module.role[0].arn

  artifact_s3_location = "s3://${module.s3.name}/"

  snapshot_bucket_name = var.snapshot_bucket_name != null ? var.snapshot_bucket_name : local.name
  execution_role_name  = var.execution_role_name != null ? var.execution_role_name : local.name

  creator = "terraform"

  defaulted_tags = merge(
    var.tags,
    {
      Name                                      = local.name
      "${var.organization}:billing:product"     = var.product
      "${var.organization}:billing:environment" = var.environment
      creator                                   = local.creator
      repo                                      = var.repo
    }
  )

  tags = merge({ for k, v in local.defaulted_tags : k => v if lookup(data.aws_default_tags.common_tags.tags, k, "") != v })
}

data "aws_default_tags" "common_tags" {}
