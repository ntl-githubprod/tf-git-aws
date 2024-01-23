resource "aws_s3_bucket" "bca-aws-master-ntl" {
  bucket = var.bca-aws-master-ntl
}
resource "aws_s3_bucket_ownership_controls" "bca-aws-master-ntl_ownership" {
  bucket = aws_s3_bucket.bca-aws-master-ntl.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}
resource "aws_s3_bucket_acl" "s3_bucket_acl_tfstate" {
  depends_on = [aws_s3_bucket_ownership_controls.bca-aws-master-ntl_ownership]
  bucket = aws_s3_bucket.bca-aws-master-ntl.id
  acl    = "private"
}
resource "aws_s3_bucket_versioning" "s3_versioning_tfstate" {
  bucket = aws_s3_bucket.bca-aws-master-ntl.id
  versioning_configuration {
    status = "Enabled"
  }
}
resource "aws_s3_bucket_server_side_encryption_configuration" "bca-aws-master-ntl" {
  bucket = aws_s3_bucket.bca-aws-master-ntl.id
  rule {
    apply_server_side_encryption_by_default {
      # kms_master_key_id = aws_kms_key.mykey.arn
      sse_algorithm = "AES256"
    }
  }
}
resource "aws_dynamodb_table" "terraform_locks" {
  #   provider = aws.gritworks-master
  name         = var.backend_dynamodb_table_name
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
}