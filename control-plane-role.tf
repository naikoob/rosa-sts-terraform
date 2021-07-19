resource "aws_iam_role" "managedopenshift_control_plane_role" {
  name        = "ManagedOpenShift-ControlPlane-Role"
  path        = "/"
  description = "Managed OpenShift Control Plane Role"

  assume_role_policy = jsonencode(
    {
      "Version" : "2012-10-17",
      "Statement" : [
        {
          "Effect" : "Allow",
          "Principal" : {
            "Service" : "ec2.amazonaws.com"
          },
          "Action" : "sts:AssumeRole"
        }
      ]
    }
  )

  managed_policy_arns = [aws_iam_policy.managedopenshift_control_plane_policy.arn]
}

resource "aws_iam_policy" "managedopenshift_control_plane_policy" {
  name = "ManagedOpenShift-ControlPlane-Policy"
  path = "/"

  policy = jsonencode(
    {
      "Version" : "2012-10-17",
      "Statement" : [
        {
          "Effect" : "Allow",
          "Action" : [
            "ec2:AttachVolume",
            "ec2:AuthorizeSecurityGroupIngress",
            "ec2:CreateSecurityGroup",
            "ec2:CreateTags",
            "ec2:CreateVolume",
            "ec2:DeleteSecurityGroup",
            "ec2:DeleteVolume",
            "ec2:Describe*",
            "ec2:DetachVolume",
            "ec2:ModifyInstanceAttribute",
            "ec2:ModifyVolume",
            "ec2:RevokeSecurityGroupIngress",
            "elasticloadbalancing:AddTags",
            "elasticloadbalancing:AttachLoadBalancerToSubnets",
            "elasticloadbalancing:ApplySecurityGroupsToLoadBalancer",
            "elasticloadbalancing:CreateListener",
            "elasticloadbalancing:CreateLoadBalancer",
            "elasticloadbalancing:CreateLoadBalancerPolicy",
            "elasticloadbalancing:CreateLoadBalancerListeners",
            "elasticloadbalancing:CreateTargetGroup",
            "elasticloadbalancing:ConfigureHealthCheck",
            "elasticloadbalancing:DeleteListener",
            "elasticloadbalancing:DeleteLoadBalancer",
            "elasticloadbalancing:DeleteLoadBalancerListeners",
            "elasticloadbalancing:DeleteTargetGroup",
            "elasticloadbalancing:DeregisterInstancesFromLoadBalancer",
            "elasticloadbalancing:DeregisterTargets",
            "elasticloadbalancing:Describe*",
            "elasticloadbalancing:DetachLoadBalancerFromSubnets",
            "elasticloadbalancing:ModifyListener",
            "elasticloadbalancing:ModifyLoadBalancerAttributes",
            "elasticloadbalancing:ModifyTargetGroup",
            "elasticloadbalancing:ModifyTargetGroupAttributes",
            "elasticloadbalancing:RegisterInstancesWithLoadBalancer",
            "elasticloadbalancing:RegisterTargets",
            "elasticloadbalancing:SetLoadBalancerPoliciesForBackendServer",
            "elasticloadbalancing:SetLoadBalancerPoliciesOfListener",
            "kms:DescribeKey"
          ],
          "Resource" : "*"
        }
      ]
    }
  )
}
