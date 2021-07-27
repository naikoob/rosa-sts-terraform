# variables.tf
variable "aws_account_id" {
  description = "AWS account where ROSA will be provisioned"
  type        = string
}

variable "rosa_admin_role" {
  description = "IAM role used to install ROSA"
  default     = "RosaAdminRole"
}

variable "rosa_cluster_id" {
  description = "ROSA cluster id"
  type        = string
  default     = "replace_me"
}

variable "rosa_oidc_thumbprint" {
  description = "ROSA OIDC provider thumbprint"
  type        = string
  default     = "0123456789012345678901234567890123456789"
}
