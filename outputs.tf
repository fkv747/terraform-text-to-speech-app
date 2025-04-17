# root-level outputs.tf
output "api_gateway_api_endpoint" {
  value       = module.api_gateway.api_endpoint
  description = "Public URL of the deployed API Gateway"
}
