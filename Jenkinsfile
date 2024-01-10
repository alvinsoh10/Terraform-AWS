pipeline {

    agent any
     stages {
        stage ('Checkout'){
            steps{
                script{
                    dir('terraform'){
                        sh("git archive --remote=https://github.com/alvinsoh10/Terraform-AWS.git master Terraform")
                        
                    }
                }
            }
        }
        stage('Plan'){
            steps{
                sh 'pwd;cd terraform/ ; terraform init'
                sh "pwd;cd terraform/ ; terraform plan -out tfplan"
                sh 'pwd;cd terraform/ ; terraform show -no-color tfplan > tfplan.txt'
            }
        }

        stage('Build'){
            steps{
                sh "pwd;cd terraform/ ; terraform apply -input=false tfplan"
            }
        }
     }
}