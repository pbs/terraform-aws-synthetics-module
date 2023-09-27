variable "environment" {
  description = "Environment (sharedtools, dev, staging, qa, prod)"
  type        = string
  validation {
    condition     = contains(["sharedtools", "dev", "staging", "qa", "prod"], var.environment)
    error_message = "The environment variable must be one of [sharedtools, dev, staging, qa, prod]."
  }
}

variable "product" {
  description = "Tag used to group resources according to product"
  type        = string
  validation {
    condition     = can(regex("[a-z\\-]+", var.product))
    error_message = "The product variable violates approved regex."
  }
  default     = "pbsorg"
}

variable "repo" {
  description = "Tag used to point to the repo using this module"
  type        = string
  validation {
    condition     = can(regex("(?:git|ssh|https?|git@[-\\w.]+):(\\/\\/)?(.*?)(\\.git)(\\/?|\\#[-\\d\\w._]+?)$", var.repo))
    error_message = "The repo variable violates approved regex."
  }
  default = "git@github.com:pbs/pbsorg"
}

variable "organization" {
  description = "Organization using this module. Used to prefix tags so that they are easily identified as being from your organization"
  type        = string
  validation {
    condition     = can(regex("[a-z\\-]+", var.organization))
    error_message = "The organization variable violates approved regex."
  }
  default = "pbs"
}

variable "owner" {
  description = "The group within PBS that is accountable for the project using this module."
  type        = string
  validation {
    condition     = contains(["videoapps", "identity", "ap", "webservices", "vidtech", "core", "consumer"], var.owner)
    error_message = "The organization variable violates approved regex."
  }
  default = "ap"
}

variable "tags" {
  description = "Extra tags"
  default     = {}
  type        = map(string)
}
