pipeline {
	agent any 

	environments {
		AWS_DEFAULT_REGION = "us-east-1"
	}
	
	stages {

		stage('checkout') {
			steps {
				checkout scm
			}
		}

		stage('Terraform Init') {
			steps {
				sh 'terraform init'
			}
		}

		stage('Terraform plan')
			steps {
				sh 'terraform plan'
			}
		}

		stage('Terraform apply')
			steps {
				sh 'terraform apply -auto-approve'
			}
		}
	}
}