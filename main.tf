locals {
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = [
          "sts:AssumeRole"
        ],
        Resource = var.assume_role_arns
      }
    ]
  })
}

resource "aws_iam_policy" "this" {
  name   = var.name
  policy = length(var.assume_role_arns) > 0 ? local.assume_role_policy : var.policy
  lifecycle {
    ignore_changes = [
      tags,
      tags_all
    ]
  }
}
