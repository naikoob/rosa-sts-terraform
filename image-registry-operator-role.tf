resource "aws_iam_role" "managedopenshift_openshift_image_registry_operator_role" {
  name        = "ManagedOpenShift-openshift-image-registry-installer-cloud-creden"
  path        = "/"
  description = "OpenShift Machine API Operator Role"

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

  managed_policy_arns = [aws_iam_policy.managedopenshift_openshift_image_registry_operator_policy.arn]
}

resource "aws_iam_policy" "managedopenshift_openshift_image_registry_operator_policy" {
  name = "ManagedOpenShift-openshift-image-registry-policy"
  path = "/"

  policy = jsonencode(
    {
      "Version" : "2012-10-17",
      "Statement" : [
        {
          "Effect" : "Allow",
          "Action" : [
            "s3:CreateBucket",
            "s3:DeleteBucket",
            "s3:PutBucketTagging",
            "s3:GetBucketTagging",
            "s3:PutBucketPublicAccessBlock",
            "s3:GetBucketPublicAccessBlock",
            "s3:PutEncryptionConfiguration",
            "s3:GetEncryptionConfiguration",
            "s3:PutLifecycleConfiguration",
            "s3:GetLifecycleConfiguration",
            "s3:GetBucketLocation",
            "s3:ListBucket",
            "s3:GetObject",
            "s3:PutObject",
            "s3:DeleteObject",
            "s3:ListBucketMultipartUploads",
            "s3:AbortMultipartUpload",
            "s3:ListMultipartUploadParts"
          ],
          "Resource" : "*"
        }
      ]
    }
  )
}
