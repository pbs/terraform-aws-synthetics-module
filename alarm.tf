resource "aws_cloudwatch_metric_alarm" "alarm" {
  alarm_name                = "canary-${local.name}"
  comparison_operator       = var.alarm_config.comparison_operator
  period                    = var.alarm_config.period
  evaluation_periods        = var.alarm_config.evaluation_periods
  metric_name               = var.alarm_config.metric_name
  namespace                 = var.alarm_config.namespace
  statistic                 = var.alarm_config.statistic
  datapoints_to_alarm       = var.alarm_config.datapoints_to_alarm
  threshold                 = var.alarm_config.threshold
  alarm_actions             = var.alarm_config.alarm_actions
  ok_actions                = var.alarm_config.ok_actions
  insufficient_data_actions = var.alarm_config.insufficient_data_actions
  alarm_description         = var.alarm_config.description != null ? var.alarm_config.description : "Alarm for ${local.name} Canary"
  dimensions = {
    CanaryName = local.name
  }
}
