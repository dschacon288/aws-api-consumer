variable "aws_region" {
  description = "AWS region for deployment"
  type        = string
}

variable "lambda_env_var" {
  description = "Environment variable for the Lambda function"
  type        = string
}

variable "blocked_ips" {
  description = "List of IPs to block in WAF"
  type        = list(string)
}

variable "api_name" {
  description = "Name of the API Gateway"
  type        = string
}

variable "waf_name" {
  description = "Name of the WAF ACL"
  type        = string
}

variable "cognito_user_pool_name" {
  description = "Name of the Cognito User Pool"
  type        = string
}

variable "sns_topic_name" {
  description = "Name of the SNS topic for alerts"
  type        = string
}

variable "sns_email_recipient" {
  description = "Email address to receive SNS notifications"
  type        = string
}
