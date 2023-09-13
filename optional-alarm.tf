variable "alarm_config" {
  description = "Configurations for the alarm"
  type = object({
    comparison_operator = string
    period              = number
    evaluation_periods  = number
    metric_name         = string
    namespace           = string
    statistic           = string
    datapoints_to_alarm = number
    threshold           = string
    actions             = list(string)
    description         = optional(string)
  })
  default = {
    comparison_operator = "LessThanThreshold"
    period              = 300
    evaluation_periods  = 1
    metric_name         = "SuccessPercent"
    namespace           = "CloudWatchSynthetics"
    statistic           = "Sum"
    datapoints_to_alarm = 1
    threshold           = "90"
    actions             = []
    description         = null
  }
}
