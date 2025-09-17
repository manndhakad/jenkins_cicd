terraform {
  backend "s3" {
    bucket  = "c3opsstate"                 # Replace with your bucket name
    key     = "envs/dev/terraform.tfstate" # Path to state file in the bucket
    region  = "ap-south-1"                 # Replace with your AWS region
    encrypt = true                         # Encrypt the state file at rest
    #dynamodb_table = "terraform-locks"                # (Optional) for state locking
  }
}
