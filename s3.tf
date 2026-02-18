resource "aws_s3_bucket" "mybucket" {
	bucket = "tf-aws-jyothi-gunde"
}

resource "aws_s3_bucket_versioning" "versioning" {
	bucket = aws_s3_bucket.mybucket.id

	versioning_configuration {
		status = "Enabled"
	}
}

resource "aws_s3_bucket_server_side_encryption_configuration" "encryption" {
	bucket = aws_s3_bucket.mybucket.id

	rule {
		apply_server_side_encryption_by_default {
			sse_algorithm = "AES256"
		}
	}
}

resource "aws_s3_account_public_access_block" "block_public" {
	ignore_public_acls = true
	block_public_acls = true
	block_public_policy = true
	restrict_public_buckets = true
}



