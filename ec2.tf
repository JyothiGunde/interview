terraform {
	backend "s3" {
		bucket = "terraform-github-actions-jyothi-gunde"
		key = "terraform.tfstate"
		region = "us-east-1"
	}
}
		
provider "aws" {
	region = "us-east-1"
}

resource "aws_instance" "my-ec2-tf" {
	ami = "ami-07ff62358b87c7116"
	instance_type = "t2.nano"

	tags = {
		Name = "demo"
	}
}