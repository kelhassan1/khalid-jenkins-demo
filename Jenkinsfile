pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub-credentials')
        IMAGE_NAME = "khalid-python-app"
        DOCKERHUB_USER = "${DOCKERHUB_CREDENTIALS_USR}"
    }

    stages {
        stage('Khalid - Build Docker Image') {
            steps {
                echo "Building Docker image..."
                sh 'docker build -t $DOCKERHUB_USER/$IMAGE_NAME:latest .'
            }
        }

        stage('Khalid - Login to Dockerhub') {
            steps {
                echo "Logging into DockerHub..."
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_USER --password-stdin'
            }
        }

        stage('Khalid - Push image to Dockerhub') {
            steps {
                echo "Pushing image to DockerHub..."
                sh 'docker push $DOCKERHUB_USER/$IMAGE_NAME:latest'
            }
        }
    }
}
