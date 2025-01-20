provider "aws" {
  region = var.module_aws_region
}

# Consumo del módulo del primer repositorio
module "lambda_api_module" {
  source = "git::https://github.com/dschacon288/lambda_api_module.git"
  module_aws_region   = var.module_aws_region
  module_lambda_name            = var.module_lambda_name
  module_lambda_env_var         = var.module_lambda_env_var
  module_api_name               = var.module_api_name
  module_cognito_user_pool_name = var.module_cognito_user_pool_name
  module_waf_name               = var.module_waf_name
  module_blocked_ips            = var.module_blocked_ips
}

# Configuración de un tópico SNS
resource "aws_sns_topic" "alerts_topic" {
  name = var.sns_topic_name
}

# Suscripción por correo electrónico al tópico SNS
resource "aws_sns_topic_subscription" "email_subscription" {
  topic_arn = aws_sns_topic.alerts_topic.arn
  protocol  = "email"
  endpoint  = var.sns_email_recipient # Dirección de correo electrónico
}

# SNS Policy para permitir publicaciones desde AWS Lambda
resource "aws_sns_topic_policy" "sns_policy" {
  arn = aws_sns_topic.alerts_topic.arn

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect    = "Allow",
        Principal = "*",
        Action    = "sns:Publish",
        Resource  = aws_sns_topic.alerts_topic.arn
      }
    ]
  })
}
