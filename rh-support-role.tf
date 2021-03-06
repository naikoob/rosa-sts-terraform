resource "aws_iam_role" "managedopenshift_support_role" {
  name        = "ManagedOpenShift-Support-Role"
  path        = "/"
  description = "ManagedOpenShift RedHat Support Role"

  assume_role_policy = jsonencode(
    {
      "Version" : "2012-10-17",
      "Statement" : [
        {
          "Effect" : "Allow",
          "Principal" : {
            "AWS" : [
              "arn:aws:iam::710019948333:role/RH-Technical-Support-Access"
            ]
          },
          "Action" : "sts:AssumeRole"
        }
      ]
    }
  )

  managed_policy_arns = [aws_iam_policy.managedopenshift_support_policy.arn]
}

resource "aws_iam_policy" "managedopenshift_support_policy" {
  name = "ManagedOpenShift-Support-Policy"
  path = "/"

  policy = jsonencode(
    {
      "Version" : "2012-10-17",
      "Statement" : [
        {
          "Effect" : "Allow",
          "Action" : [
            "cloudtrail:DescribeTrails",
            "cloudtrail:LookupEvents",
            "cloudwatch:GetMetricData",
            "cloudwatch:GetMetricStatistics",
            "cloudwatch:ListMetrics",
            "ec2:CopySnapshot",
            "ec2:CreateSnapshot",
            "ec2:CreateSnapshots",
            "ec2:DescribeAccountAttributes",
            "ec2:DescribeAddresses",
            "ec2:DescribeAddressesAttribute",
            "ec2:DescribeAggregateIdFormat",
            "ec2:DescribeAvailabilityZones",
            "ec2:DescribeByoipCidrs",
            "ec2:DescribeCapacityReservations",
            "ec2:DescribeCarrierGateways",
            "ec2:DescribeClassicLinkInstances",
            "ec2:DescribeClientVpnAuthorizationRules",
            "ec2:DescribeClientVpnConnections",
            "ec2:DescribeClientVpnEndpoints",
            "ec2:DescribeClientVpnRoutes",
            "ec2:DescribeClientVpnTargetNetworks",
            "ec2:DescribeCoipPools",
            "ec2:DescribeCustomerGateways",
            "ec2:DescribeDhcpOptions",
            "ec2:DescribeEgressOnlyInternetGateways",
            "ec2:DescribeIamInstanceProfileAssociations",
            "ec2:DescribeIdFormat",
            "ec2:DescribeIdentityIdFormat",
            "ec2:DescribeImageAttribute",
            "ec2:DescribeImages",
            "ec2:DescribeInstanceAttribute",
            "ec2:DescribeInstanceStatus",
            "ec2:DescribeInstanceTypeOfferings",
            "ec2:DescribeInstanceTypes",
            "ec2:DescribeInstances",
            "ec2:DescribeInternetGateways",
            "ec2:DescribeIpv6Pools",
            "ec2:DescribeKeyPairs",
            "ec2:DescribeLaunchTemplates",
            "ec2:DescribeLocalGatewayRouteTableVirtualInterfaceGroupAssociations",
            "ec2:DescribeLocalGatewayRouteTableVpcAssociations",
            "ec2:DescribeLocalGatewayRouteTables",
            "ec2:DescribeLocalGatewayVirtualInterfaceGroups",
            "ec2:DescribeLocalGatewayVirtualInterfaces",
            "ec2:DescribeLocalGateways",
            "ec2:DescribeNatGateways",
            "ec2:DescribeNetworkAcls",
            "ec2:DescribeNetworkInterfaces",
            "ec2:DescribePlacementGroups",
            "ec2:DescribePrefixLists",
            "ec2:DescribePrincipalIdFormat",
            "ec2:DescribePublicIpv4Pools",
            "ec2:DescribeRegions",
            "ec2:DescribeReservedInstances",
            "ec2:DescribeRouteTables",
            "ec2:DescribeScheduledInstances",
            "ec2:DescribeSecurityGroupReferences",
            "ec2:DescribeSecurityGroups",
            "ec2:DescribeSnapshotAttribute",
            "ec2:DescribeSnapshots",
            "ec2:DescribeSpotFleetInstances",
            "ec2:DescribeStaleSecurityGroups",
            "ec2:DescribeSubnets",
            "ec2:DescribeTags",
            "ec2:DescribeTransitGatewayAttachments",
            "ec2:DescribeTransitGatewayConnectPeers",
            "ec2:DescribeTransitGatewayConnects",
            "ec2:DescribeTransitGatewayMulticastDomains",
            "ec2:DescribeTransitGatewayPeeringAttachments",
            "ec2:DescribeTransitGatewayRouteTables",
            "ec2:DescribeTransitGatewayVpcAttachments",
            "ec2:DescribeTransitGateways",
            "ec2:DescribeVolumeAttribute",
            "ec2:DescribeVolumeStatus",
            "ec2:DescribeVolumes",
            "ec2:DescribeVolumesModifications",
            "ec2:DescribeVpcAttribute",
            "ec2:DescribeVpcClassicLink",
            "ec2:DescribeVpcClassicLinkDnsSupport",
            "ec2:DescribeVpcEndpointConnectionNotifications",
            "ec2:DescribeVpcEndpointConnections",
            "ec2:DescribeVpcEndpointServiceConfigurations",
            "ec2:DescribeVpcEndpointServicePermissions",
            "ec2:DescribeVpcEndpointServices",
            "ec2:DescribeVpcEndpoints",
            "ec2:DescribeVpcPeeringConnections",
            "ec2:DescribeVpcs",
            "ec2:DescribeVpnConnections",
            "ec2:DescribeVpnGateways",
            "ec2:GetAssociatedIpv6PoolCidrs",
            "ec2:GetTransitGatewayAttachmentPropagations",
            "ec2:GetTransitGatewayMulticastDomainAssociations",
            "ec2:GetTransitGatewayPrefixListReferences",
            "ec2:GetTransitGatewayRouteTableAssociations",
            "ec2:GetTransitGatewayRouteTablePropagations",
            "ec2:RebootInstances",
            "ec2:SearchLocalGatewayRoutes",
            "ec2:SearchTransitGatewayMulticastGroups",
            "ec2:SearchTransitGatewayRoutes",
            "ec2:StartInstances",
            "ec2:TerminateInstances",
            "elasticloadbalancing:ConfigureHealthCheck",
            "elasticloadbalancing:DescribeAccountLimits",
            "elasticloadbalancing:DescribeInstanceHealth",
            "elasticloadbalancing:DescribeListenerCertificates",
            "elasticloadbalancing:DescribeListeners",
            "elasticloadbalancing:DescribeLoadBalancerAttributes",
            "elasticloadbalancing:DescribeLoadBalancerPolicies",
            "elasticloadbalancing:DescribeLoadBalancerPolicyTypes",
            "elasticloadbalancing:DescribeLoadBalancers",
            "elasticloadbalancing:DescribeRules",
            "elasticloadbalancing:DescribeSSLPolicies",
            "elasticloadbalancing:DescribeTags",
            "elasticloadbalancing:DescribeTargetGroupAttributes",
            "elasticloadbalancing:DescribeTargetGroups",
            "elasticloadbalancing:DescribeTargetHealth",
            "route53:GetHostedZone",
            "route53:GetHostedZoneCount",
            "route53:ListHostedZones",
            "route53:ListHostedZonesByName",
            "route53:ListResourceRecordSets",
            "s3:GetBucketTagging",
            "s3:GetObjectAcl",
            "s3:GetObjectTagging",
            "s3:ListAllMyBuckets"
          ],
          "Resource" : "*"
        },
        {
          "Effect" : "Allow",
          "Action" : "s3:ListBucket",
          "Resource" : [
            "arn:aws:s3:::managed-velero*",
            "arn:aws:s3:::*image-registry*"
          ]
        }
      ]
    }
  )
}
