resource "aws_iam_openid_connect_provider" "rosa_oidc_provider" {
  url = "https://rh-oidc.s3.us-east-1.amazonaws.com/${var.rosa_cluster_id}"

  client_id_list = [
    "openshift",
    "sts.amazonaws.com"
  ]

  thumbprint_list = ["F50B771A162C3B58639932177DD46AA8D69E0247"]
}