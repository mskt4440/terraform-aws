# Create cloudweatch logs log group
resource "aws_cloudwatch_log_group" "flowlog" {
  name              = "flowlog"
  retention_in_days = "7"

  tags = {
    Name        = format("%s-%s", var.environment, var.component)
    Environment = var.environment
    Component   = var.component
  }
}
