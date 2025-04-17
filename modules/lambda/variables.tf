variable "function_name" {
  type        = string
  description = "Name of the Lambda function"
}

variable "lambda_zip_path" {
  type        = string
  description = "Path to the zipped Lambda deployment package"
}

variable "handler" {
  type        = string
  description = "Lambda function handler (e.g. index.handler)"
}

variable "runtime" {
  type        = string
  description = "Lambda runtime (e.g. python3.9, nodejs18.x)"
}

variable "role_arn" {
  type        = string
  description = "IAM role ARN for Lambda to assume"
}

variable "environment_variables" {
  type        = map(string)
  default     = {}
}

variable "timeout" {
  type    = number
  default = 3
}

variable "memory" {
  type    = number
  default = 128
}
