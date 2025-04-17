variable "role_name" {
  type        = string
  description = "Name of the IAM role"
}

variable "assume_role_policy" {
  type        = string
  description = "JSON trust policy for the IAM role"
}

variable "inline_policy" {
  type        = string
  description = "Optional inline policy JSON"
  default     = ""
}

variable "policy_arns" {
  type        = list(string)
  description = "List of AWS managed policy ARNs to attach"
  default     = []
}
