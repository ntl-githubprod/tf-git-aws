# own remote-backend variables
variable "bca-aws-master-ntl" {
  description = "AWS S3 Bucket Name"
  type        = string
  default     = "aws-s3-backend-tfstate"
}
variable "backend_dynamodb_table_name" {
  description = "AWS DynamoDB Table Name"
  type        = string
  default     = "aws-dynamodb-backend-tfstate"
}