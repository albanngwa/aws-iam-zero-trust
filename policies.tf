# Define the IAM policy
resource "aws_iam_policy" "dev_policy" {
  name        = "dev_policy"
  description = "Deny all actions unless MFA is present"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid      = "BlockActionsUnlessMFAPresent"
        Effect   = "Deny"
        Action   = "*"
        Resource = "*"
        Condition = {
          BoolIfExists = {
            "aws:MultiFactorAuthPresent" = "false"
          }
        }
      }
    ]
  })
}

# Attach the policy to the group
resource "aws_iam_group_policy_attachment" "dev_group_attach" {
  group      = aws_iam_group.developers.name
  policy_arn = aws_iam_policy.dev_policy.arn
}
