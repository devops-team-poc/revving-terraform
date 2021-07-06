terraform {
  backend "s3" {
    bucket = "test-env-s3bucket"
    key    = "environment/test/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "DYNAMODB-NAME"     # This is a DynamoDB table with the Primary Key set to LockID
    encrypt = true     #Enable server side encryption on your terraform state
  }
}
