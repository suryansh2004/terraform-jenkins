pipeline {
    agent any
    environment {
        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
    }
    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', credentialsId: 'GIT_CREDENTIALS', url: 'https://github.com/suryansh2004/terraform-jenkins'
            }
        }
        stage('Terraform Init') {
            steps {
                sh '/opt/homebrew/bin/terraform init'
            }
        }
        stage('Terraform Plan') {
            steps {
                sh '/opt/homebrew/bin/terraform plan -out=tfplan'
            }
        }
        stage('Terraform Apply') {
            steps {
                input message: "Proceed with apply?"
                sh '/opt/homebrew/bin/terraform apply -auto-approve'
            }
        }
    }
}
