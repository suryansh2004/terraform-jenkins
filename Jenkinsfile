pipeline {
    agent any
    environment {
        AWS_ACCESS_KEY_ID     = credentials('AWS_CREDENTIALS')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_CREDENTIALS')
    }
    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', credentialsId: 'GIT_CREDENTIALS', url: 'https://github.com/suryansh2004/terraform-jenkins'
            }
        }
        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }
        stage('Terraform Plan') {
            steps {
                sh 'terraform plan -out=tfplan'
            }
        }
        stage('Terraform Apply') {
            steps {
                input message: "Proceed with apply?"
                sh 'terraform apply -auto-approve'
            }
        }
    }
}