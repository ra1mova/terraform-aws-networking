pipeline {
    agent { label 'terraform' }
//     tools {
//         terraform 'terraform'
//         }
stages {
        stage('Git Checkout') {
            steps {
                git branch: 'main', credentialsId: 'roza', url: 'https://github.com/ra1mova/networking'
            }
        }
        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }
        stage('Terraform Plan') {
            steps {
                   
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'cloud1-aws-credentials', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]) 
                {
                sh 'terraform plan'
                }
            }
            }
        stage('Terraform Apply') {
            steps {
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'cloud1-aws-credentials', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]) 
                {
                
                sh 'terraform apply --auto-approve'
                }
            }
        }
        stage('Terraform Destroy') {
            steps {
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'cloud1-aws-credentials', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]) 
                {
                
                sh 'terraform destroy --auto-approve'
                }
            }
        }
    }
    post {
	
       success {
           emailext to: "roza.raimova11@gmail.com",
            subject: "Sended by Roza",
            body: "FROM Jenkins",
            attachLog: true
		    }
    }
}
