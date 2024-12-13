variable "bucket_name" {
  default = ["expense-prajai-bucket-dev", "expense-prajai-bucket-qa", "expense-prajai-bucket-prod"]

}

variable "dynamodb_table_name" {
    default = ["prajai-locking-table-dev", "prajai-locking-table-qa", "prajai-locking-table-prod"]
}

