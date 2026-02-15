pipeline {
	agent any 
	
	environment {
		AWS_DEFAULT_REGION = "us-east-1"
	}

	stages {
	
		stage('checkout) {
			steps {
				checkout scm
			}
		}

		stage('Terraform Init') {
			steps {
				sh 'terraform init'
			}
		}

		stage('Terraform Plan') {
			steps {
				sh 'terraform plan'
			}
		}

		stage('Terraform Apply') {
			steps {
				sh 'terraform apply -auto-approve'
			}
		}
		
		stage('Terraform Destroy') {
			when {
				expression { return param.Destory_Infra == true }
			}
			steps {
				sh 'terraform destroy -auto-approve
			}
		}

	}

	parameters {
		booleanParam(name: 'Destroy_Infra', defaultValue: false, description: 'set true to destroy infra')
	}
}