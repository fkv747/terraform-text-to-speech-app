resource "aws_iam_role" "this" {
  name               = var.role_name
  assume_role_policy = var.assume_role_policy

  tags = {
    Name = var.role_name
  }
}

resource "aws_iam_policy" "inline" {
  count  = var.inline_policy != "" ? 1 : 0
  name   = "${var.role_name}-policy"
  policy = var.inline_policy
}

resource "aws_iam_role_policy_attachment" "attach" {
  count      = var.policy_arns != [] ? length(var.policy_arns) : 0
  role       = aws_iam_role.this.name
  policy_arn = var.policy_arns[count.index]
}

resource "aws_iam_role_policy_attachment" "inline_attach" {
  count      = var.inline_policy != "" ? 1 : 0
  role       = aws_iam_role.this.name
  policy_arn = aws_iam_policy.inline[0].arn
}
