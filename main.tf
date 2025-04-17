provider "aws" {
  region = "us-east-1"
}

# 1️⃣ IAM Role for Lambda (Module)
module "lambda_role" {
  source = "./modules/iam"

  role_name = "polly_lambda_exec_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })

  policy_arns = [
    "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole",
    "arn:aws:iam::aws:policy/AmazonPollyFullAccess",
    "arn:aws:iam::aws:policy/AmazonS3FullAccess"
  ]

  inline_policy = ""
}


# 2️⃣ Lambda Function (Module)
module "polly_lambda" {
  source = "./modules/lambda"

  function_name     = "textToSpeech"
  handler           = "polly_handler.lambda_handler"
  runtime           = "python3.12"
  role_arn          = module.lambda_role.role_arn
  lambda_zip_path   = "${path.module}/lambda/function.zip"
  environment_variables = {
     BUCKET_NAME = module.polly_s3.bucket_name
  }
}

# 3️⃣ API Gateway (Module)
module "api_gateway" {
  source = "./modules/api_gateway"

  api_name     = "PollyAPI"
  lambda_arn   = module.polly_lambda.lambda_function_arn
  route_path   = "convert"
  method       = "POST"
}

# 4️⃣ S3 (Module)
module "polly_s3" {
  source            = "./modules/s3"
  bucket_name       = "polly-audio-${random_id.bucket_suffix.hex}"
  enable_versioning = false
  enable_encryption = true
  is_public         = false
}

resource "random_id" "bucket_suffix" {
  byte_length = 4
}


# 5️⃣ Amplify (Module)
module "amplify_app" {
  source   = "./modules/amplify"
  app_name = "tts-app"
}
