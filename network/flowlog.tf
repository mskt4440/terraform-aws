# Setup VPC flowlog
## S3
resource "aws_flow_log" "s3_flowlog" {
  log_destination_type = "s3"
  log_destination      = aws_s3_bucket.bucket_flowlog.arn
  traffic_type         = "ALL"
  vpc_id               = aws_vpc.vpc.id
}
## cloudwathc logs
resource "aws_flow_log" "cwlogs_flowlog" {
  iam_role_arn    = aws_iam_role.role_flowlog.arn
  log_destination = aws_cloudwatch_log_group.flowlog.arn
  traffic_type    = "ALL"
  vpc_id          = aws_vpc.vpc.id
}
