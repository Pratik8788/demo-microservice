pipeline {
    agent any

    tools {
        maven 'Maven-3'
    }

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/yourname/demo-microservice.git'
            }
        }

        stage('Build') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage('Test') {
            steps {
                sh 'mvn test'
            }
        }

        stage('Docker Build') {
            steps {
                sh 'docker build -t demo-microservice:latest .'
            }
        }
    }

    post {
        success {
            echo 'Build Successful 🎉'
        }
        failure {
            echo 'Build Failed ❌'
        }
    }
}
