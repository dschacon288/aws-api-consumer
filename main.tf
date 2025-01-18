provider "aws" {
  region = var.aws_region
}

# Consumo del módulo del primer repositorio
module "lambda_api_module" {
  source              = "git::https://github.com/dschacon288/lambda_api_module.git"
  aws_region          = var.aws_region
  lambda_env_var      = var.lambda_env_var
  blocked_ips         = var.blocked_ips
  api_name            = var.api_name
  waf_name            = var.waf_name
  cognito_user_pool_name = var.cognito_user_pool_name
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
