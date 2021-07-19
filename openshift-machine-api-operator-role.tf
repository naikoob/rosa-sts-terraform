resource "aws_iam_role" "managedopenshift_openshift_machine_api_role" {
  name        = "ManagedOpenShift-openshift-machine-api-aws-cloud-credentials"
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

  managed_policy_arns = [aws_iam_policy.managedopenshift_openshift_machine_api_policy.arn]
}

resource "aws_iam_policy" "managedopenshift_openshift_machine_api_policy" {
  name = "ManagedOpenShift-openshift-machine-api-aws-policy"
  path = "/"

  policy = jsonencode(
    {
      "Version" : "2012-10-17",
      "Statement" : [
        {
          "Effect" : "Allow",
          "Action" : [
            "ec2:CreateTags",
            "ec2:DescribeAvailabilityZones",
            "ec2:DescribeDhcpOptions",
            "ec2:DescribeImages",
            "ec2:DescribeInstances",
            "ec2:DescribeSecurityGroups",
            "ec2:DescribeSubnets",
            "ec2:DescribeVpcs",
            "ec2:RunInstances",
            "ec2:TerminateInstances",
            "elasticloadbalancing:DescribeLoadBalancers",
            "elasticloadbalancing:DescribeTargetGroups",
            "elasticloadbalancing:RegisterInstancesWithLoadBalancer",
            "elasticloadbalancing:RegisterTargets",
            "iam:PassRole",
            "iam:CreateServiceLinkedRole"
          ],
          "Resource" : "*"
        },
        {
          "Effect" : "Allow",
          "Action" : [
            "kms:Decrypt",
            "kms:Encrypt",
            "kms:GenerateDataKey",
            "kms:GenerateDataKeyWithoutPlainText",
            "kms:DescribeKey"
          ],
          "Resource" : "*"
        },
        {
          "Effect" : "Allow",
          "Action" : [
            "kms:RevokeGrant",
            "kms:CreateGrant",
            "kms:ListGrants"
          ],
          "Resource" : "*",
          "Condition" : {
            "Bool" : {
              "kms:GrantIsForAWSResource" : true
            }
          }
        }
      ]
    }
  )
}
