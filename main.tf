resource "aws_iam_policy" "this" {
  name = var.name
  policy = jsonencode({
    Version   = var.api_version
    Statement = var.statement
  })
  lifecycle {
    ignore_changes = [
      tags,
      tags_all
    ]
  }
}
