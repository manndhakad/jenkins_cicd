pipeline {
    agent any

    environment {
        TF_VAR_region = 'ap-south-1'
        TF_VAR_env = 'dev'
        TERRAFORM_VERSION = '1.13.2'
    }

    stages {
        stage('Install Git') {
            steps {
                sh '''
                    echo "Installing Git..."
                    sudo apt-get update -y
                    sudo apt-get install -y git
                    git --version
                '''
            }
        }

        stage('Prepare Environment') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'c3ops', usernameVariable: 'AWS_ACCESS_KEY_ID', passwordVariable: 'AWS_SECRET_ACCESS_KEY')]) {
                    sh '''
                        echo "AWS credentials configured"
                        echo "Using region: $TF_VAR_region"
                    '''
                }
            }
        }

        stage('Terraform Init') {
            steps {
                dir('iac-terraform') {
                    sh '''
                        echo "> Running terraform init..."
                        terraform version
                        terraform init -input=false
                    '''
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                dir('iac-terraform') {
                    sh '''
                        echo "> Running terraform plan..."
                        terraform plan -out=tfplan
                    '''
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                dir('iac-terraform') {
                    sh '''
                        echo "> Running terraform apply..."
                        terraform apply -auto-approve tfplan
                    '''
                }
            }
        }
    }

    post {
        success {
            steps {
                archiveArtifacts artifacts: '**/*', fingerprint: true
            }
        }
    }
}
