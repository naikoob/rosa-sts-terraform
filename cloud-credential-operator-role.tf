resource "aws_iam_role" "managedopenshift_openshift_cloud_credential_operator_role" {
  name        = "ManagedOpenShift-openshift-cloud-credential-operator-cloud-crede"
  path        = "/"
  description = "OpenShift Cloud Credential Operator Role"

  assume_role_policy = jsonencode(
    {
      "Version" : "2012-10-17",
      "Statement" : [
        {
          "Effect" : "Allow",
          "Principal" : {
            "Federated" : "arn:aws:iam::${var.aws_account_id}:oidc-provider/rh-oidc.s3.us-east-1.amazonaws.com/${var.rosa_cluster_id}"
          },
          "Action" : "sts:AssumeRoleWithWebIdentity",
          "Condition" : {
            "StringEquals" : {
              "rh-oidc.s3.us-east-1.amazonaws.com/${var.rosa_cluster_id}:aud" : "openshift"
            }
          }
        }
      ]
    }
  )

  managed_policy_arns = [aws_iam_policy.managedopenshift_openshift_cloud_credential_operator_policy.arn]
}

resource "aws_iam_policy" "managedopenshift_openshift_cloud_credential_operator_policy" {
  name = "ManagedOpenShift-openshift-cloud-credential-operator-policy"
  path = "/"

  policy = jsonencode(
    {
      "Version" : "2012-10-17",
      "Statement" : [
        {
          "Effect" : "Allow",
          "Action" : [
            "iam:GetUser",
            "iam:GetUserPolicy",
            "iam:ListAccessKeys"
          ],
          "Resource" : "*"
        }
      ]
    }
  )
}
