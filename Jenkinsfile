pipeline {
    agent {
        docker {
            image 'gradle:9.3-jdk21'
            args '-v /var/run/docker.sock:/var/run/docker.sock'
        }
    }

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

        stage('Set Gradle Permissions') {
            steps { sh 'chmod +x gradlew' }
        }

        stage('Build') {
            steps { sh './gradlew clean build' }
        }

        stage('Test') {
            steps { sh './gradlew test' }
        }

        stage('Docker Build') {
            steps { sh 'docker build -t demo-microservice:latest .' }
        }

        stage('Docker Run') {
            steps {
                sh '''
                    docker rm -f demo-microservice || true
                    docker run -d -p 8080:8080 --name demo-microservice demo-microservice:latest
                '''
            }
        }
    }

    post {
        success { echo 'Build Successful 🎉' }
        failure { echo 'Build Failed ❌' }
    }
}
