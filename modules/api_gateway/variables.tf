variable "api_name" {
  type = string
}

variable "lambda_arn" {
  type = string
  description = "Lambda function ARN to integrate with"
}

variable "route_path" {
  type = string
  description = "Route path (e.g. /convert)"
}

variable "method" {
  type = string
  default = "POST"
}

variable "stage_name" {
  type = string
  default = "prod"
}

variable "enable_cors" {
  type    = bool
  default = true
}

variable "domain_name" {
  type    = string
  default = ""
}
