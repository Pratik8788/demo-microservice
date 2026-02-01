pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git(
                    url: 'https://github.com/Pratik8788/demo-microservice.git',
                    branch: 'main',
                    credentialsId: 'github-pat'
                )
            }
        }


        stage('Build') {
            steps {
                echo 'Building with Gradle...'
                sh './gradlew clean build'
            }
        }

        stage('Test') {
            steps {
                echo 'Running tests...'
                sh './gradlew test'
            }
        }

        stage('Docker Build') {
            steps {
                echo 'Building Docker image...'
                sh 'docker build -t demo-microservice:latest .'
            }
        }

        stage('Docker Run') {
            steps {
                echo 'Running Docker container...'
                sh '''
                    # Stop any existing container
                    docker rm -f demo-microservice || true
                    # Run the container
                    docker run -d -p 8080:8080 --name demo-microservice demo-microservice:latest
                '''
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
