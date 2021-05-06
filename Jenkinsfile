pipeline {
    
    agent any
    
    environment {
        registry = "421716472970.dkr.ecr.eu-west-2.amazonaws.com/flask"
    }
    
    stages {
        
        stage('Checkout') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/jdial1996/flask-example-app']]])
            }
        }
        
        
        
        stage('Building Image') {
            steps {
                script {
                    docker.build registry
                }
                
            }
        }
        
        stage ('Docker Push') {
            steps {
                sh'aws ecr get-login-password --region eu-west-2 | docker login --username AWS --password-stdin 421716472970.dkr.ecr.eu-west-2.amazonaws.com'
                sh'docker push 421716472970.dkr.ecr.eu-west-2.amazonaws.com/flask:latest'
            }
        }
    }  
}}
