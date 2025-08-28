terraform {
    backend "s3" {
        key = "terraform_examples/tfsate.tfstate"
        bucket = "abertowy-remote-backend-2025"
        region = "eu-central-1"
        access_key = "<insert secret here>"
        secret_key = "<insert secret here>"
    }
}