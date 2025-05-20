resource "aws_iam_user" "developer" {
  name = "developer-user"
}

resource "aws_iam_user_login_profile" "developer" {
  user = aws_iam_user.developer.name
}
