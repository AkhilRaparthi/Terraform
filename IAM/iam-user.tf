resource "aws_iam_user" "test-user" {
  name = "devops-test-user"
  path = "/system/"

  tags = {
    name = "devops-test-user"
    env  = "dev"
    terraform = "true"
  }
}

resource "aws_iam_access_key" "ak" {
  user = aws_iam_user.test-user.name
}

data "aws_iam_policy_document" "test-user-policy" {
  statement {
    effect    = "Allow"
    actions   = ["ec2:*"]
    resources = ["*"]
  }
}

resource "aws_iam_user_policy" "test-user-policy" {
  name   = "test"
  user   = aws_iam_user.test-user.name
  policy = data.aws_iam_policy_document.test-user-policy
}

