resource "aws_iam_policy" "this" {
  name = var.name
  policy = length(var.assume_role_arns) > 0 ? local.assume_role_policy : var.policy
}
