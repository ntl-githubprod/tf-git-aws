output "dynamodb-arn" {
  description = "dynamodb-arn"
  value = aws_dynamodb_table.terraform_locks.arn
}