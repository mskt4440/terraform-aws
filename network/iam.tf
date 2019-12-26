# Create IAM policy and role for VPC flowlog
## Create IAM policy
data "aws_iam_policy_document" "policy_doc_flowlog" {
  statement {
    effect    = "Allow"
    resources = ["*"]

    actions = [
      "logs:CreateLogDelivery",
      "logs:DeleteLogDelivery",
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents",
      "logs:DescribeLogGroups",
      "logs:DescribeLogStreams"
    ]
  }
}
resource "aws_iam_policy" "policy_flowlog" {
  name   = "DMMbastion"
  policy = data.aws_iam_policy_document.policy_doc_flowlog.json
}
## Create assume role
data "aws_iam_policy_document" "assume_flowlog" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["vpc-flow-logs.amazonaws.com"]
    }
  }
}
## Create IAM role
resource "aws_iam_role" "role_flowlog" {
  name               = var.role_flowlog
  assume_role_policy = data.aws_iam_policy_document.assume_flowlog.json

  tags = {
    Name        = format("%s-%s", var.environment, var.component)
    Environment = var.environment
    Component   = var.component
  }
}
## Attach
resource "aws_iam_role_policy_attachment" "role_attach_flowlog" {
  role       = aws_iam_role.role_flowlog.name
  policy_arn = aws_iam_policy.policy_flowlog.arn
}
