resource "aws_iam_role" "managedopenshift_aws_ebs_csi_driver_operator_role" {
  name        = "ManagedOpenShift-openshift-cluster-csi-drivers-ebs-cloud-credent"
  path        = "/"
  description = "OpenShift Ingress Operator Role"

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

  managed_policy_arns = [aws_iam_policy.managedopenshift_aws_ebs_csi_driver_operator_policy.arn]
}

resource "aws_iam_policy" "managedopenshift_aws_ebs_csi_driver_operator_policy" {
  name = "ManagedOpenShift-openshift-cluster-csi-drivers-ebs-cloud-credent"
  path = "/"

  policy = jsonencode(
    {
      "Version" : "2012-10-17",
      "Statement" : [
        {
          "Effect" : "Allow",
          "Action" : [
            "ec2:AttachVolume",
            "ec2:CreateSnapshot",
            "ec2:CreateTags",
            "ec2:CreateVolume",
            "ec2:DeleteSnapshot",
            "ec2:DeleteTags",
            "ec2:DeleteVolume",
            "ec2:DescribeInstances",
            "ec2:DescribeSnapshots",
            "ec2:DescribeTags",
            "ec2:DescribeVolumes",
            "ec2:DescribeVolumesModifications",
            "ec2:DetachVolume",
            "ec2:ModifyVolume"
          ],
          "Resource" : "*"
        }
      ]
    }
  )
}
