#output "api_endpoint" {
#  value       = aws_apigatewayv2_stage.this.invoke_url
#  description = "Invoke URL for the deployed API"
#}

output "api_endpoint" {
  value = aws_apigatewayv2_api.this.api_endpoint
}
