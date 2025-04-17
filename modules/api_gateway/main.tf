resource "aws_apigatewayv2_api" "this" {
  name          = var.api_name
  protocol_type = "HTTP"
}

resource "aws_apigatewayv2_integration" "lambda" {
  api_id             = aws_apigatewayv2_api.this.id
  integration_type   = "AWS_PROXY"
  integration_uri    = var.lambda_arn
  integration_method = "POST"
  payload_format_version = "2.0"
}

resource "aws_apigatewayv2_route" "default" {
  api_id    = aws_apigatewayv2_api.this.id
  route_key = "${var.method} /${var.route_path}"
  target    = "integrations/${aws_apigatewayv2_integration.lambda.id}"
}

resource "aws_apigatewayv2_stage" "this" {
  api_id      = aws_apigatewayv2_api.this.id
  name        = var.stage_name
  auto_deploy = true
}

resource "aws_lambda_permission" "apigw" {
  statement_id  = "AllowAPIGatewayInvoke"
  action        = "lambda:InvokeFunction"
  function_name = var.lambda_arn
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_apigatewayv2_api.this.execution_arn}/*/*"
}

resource "aws_apigatewayv2_route" "options_convert" {
  api_id    = aws_apigatewayv2_api.this.id
  route_key = "OPTIONS /convert"
  target    = "integrations/${aws_apigatewayv2_integration.lambda.id}"
}





#resource "aws_apigatewayv2_api_mapping" "cors" {
#  count  = var.enable_cors ? 1 : 0
#  api_id = aws_apigatewayv2_api.this.id
#  domain_name = var.domain_name # Optional custom domain setup
#  stage       = aws_apigatewayv2_stage.this.name
#}
