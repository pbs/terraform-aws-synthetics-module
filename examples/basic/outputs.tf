output "arn" {
  description = "ARN of the canary."
  value       = module.synthetics.arn
}

output "engine_arn" {
  description = "ARN of the Lambda function that is used as your canary's engine."
  value       = module.synthetics.engine_arn
}

output "id" {
  description = "Name of the canary."
  value       = module.synthetics.id
}

output "name" {
  description = "Name of the canary."
  value       = module.synthetics.id
}

output "source_location_arn" {
  description = "ARN of the Lambda layer where Synthetics stores the canary script code."
  value       = module.synthetics.source_location_arn
}

output "status" {
  description = "Status of the canary."
  value       = module.synthetics.status
}

output "timeline" {
  description = "Timeline of the canary."
  value       = module.synthetics.timeline
}
