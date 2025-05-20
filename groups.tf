resource "aws_iam_group" "developers" {
  name = "Developers"
}

resource "aws_iam_group_membership" "dev_membership" {
  name  = "dev-membership"
  users = [aws_iam_user.developer.name]
  group = aws_iam_group.developers.name
}
