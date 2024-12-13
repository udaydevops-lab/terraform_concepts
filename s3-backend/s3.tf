resource "aws_s3_bucket" "expense" {
  bucket = length(var.bucket_name)

  tags = {
    Name        = "My bucket"
    Project     = "expense"
    Environment = "Dev"
  }
}

    