resource "aws_iam_role" "ec2_role" {
	name = "tf-ec2-role"

	assume_role_policy = jsonencode({
		Version = "2012-10-17"
		Statement = [{ 
				Effect = "Allow"
				principal = {
					service = "ec2.awsamzon.com"
				}
				Action = "sts:AssumeRole"
			}
		]
	})
}

resource "aws_iam_policy" "read_policy" {
	name = "S3ReadPolicy"

	policy = jsonencode({
		Version = "2012-10-17"
		Statement = [{
				Effect = "Allow"
				Action = [
					"s3:GetObject",
					"s3:ListBucket"
				]
				Resource = [
					"arn:aws:s3:::bucketname",
					"arn:aws:s3:::bucketname/*"
				]
			}
		]
	})
}

resource "aws_iam_role_policy_attachment" "attach_policy" {
  role       = aws_iam_role.ec2_role.name
  policy_arn = aws_iam_policy.read_policy.arn
}
