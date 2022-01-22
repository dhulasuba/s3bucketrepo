provider "aws" {
  region  = "ap-south-1"
}
data "aws_caller_identity" "profile" {}

output "account_id" {
  value = data.aws_caller_identity.profile.account_id
}

output "caller_arn" {
  value = data.aws_caller_identity.profile.arn
}

output "caller_user" {
  value = data.aws_caller_identity.profile.user_id
}
