output "api_gateway_url" {
  description = "URL of the API Gateway"
  value       = module.lambda_api_module.api_gateway_url
}

output "waf_arn" {
  description = "ARN of the WAF ACL"
  value       = module.lambda_api_module.waf_arn
}

output "sns_topic_arn" {
  description = "ARN of the SNS Topic"
  value       = aws_sns_topic.alerts_topic.arn
}