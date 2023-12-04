resource "aws_iam_policy" "this" {
  name = var.name
  policy = jsonencode({
    Version   = var.api_version
    Statement = var.statement
  })

  lifecycle {
    ignore_changes = [
      tags["business_unit"],
      tags["product"],
      tags["env"],
    ]
  }
}
