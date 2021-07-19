resource "aws_iam_role" "managedopenshift_worker_role" {
  name        = "ManagedOpenShift-Worker-Role"
  path        = "/"
  description = "Managed OpenShift Worker Node Role"

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

  managed_policy_arns = [aws_iam_policy.managedopenshift_worker_policy.arn]
}

resource "aws_iam_policy" "managedopenshift_worker_policy" {
  name = "ManagedOpenShift-Worker-Policy"
  path = "/"

  policy = jsonencode(
    {
      "Version" : "2012-10-17",
      "Statement" : [
        {
          "Effect" : "Allow",
          "Action" : [
            "ec2:DescribeInstances",
            "ec2:DescribeRegions"
          ],
          "Resource" : "*"
        }
      ]
    }
  )
}
