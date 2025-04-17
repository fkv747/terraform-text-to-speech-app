resource "aws_lambda_function" "this" {
  function_name = var.function_name
  filename      = var.lambda_zip_path
  handler       = var.handler
  runtime       = var.runtime
  role          = var.role_arn
  timeout       = var.timeout
  memory_size   = var.memory

  source_code_hash = filebase64sha256(var.lambda_zip_path)

  environment {
    variables = var.environment_variables
  }

  tags = {
    Name = var.function_name
  }
}
