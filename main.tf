provider "aws" {
  region = "us-west-2"
  assume_role {
    role_arn = "arn:aws:iam::${var.aws_account_id}:role/${var.rosa_admin_role}"
  }
}
