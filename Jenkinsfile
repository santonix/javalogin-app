pipeline {
    agent any
    stages {
        stage('checkout') {
            steps {
                checkout scm
            }
        }
        
        stage('Build') {
            steps {
                sh 'mvn clean install -DskipTests'
            }
        }

        stage('TEST') {
            steps {
                sh 'mvn test'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build('javalogin-app')
                }
            }
        }

        stage('Deploy Docker Image') {
            steps {
                script {
                    docker.build('santonix/santonix-javalogin-app')
                    docker.withRegistry('https://index.docker.io/v1/', 'dockerhub-credentials') {
                        docker.image('santonix/santonix-javalogin-app').push()
                    }
                    sh 'docker run -d -p 8080:9090 santonix/santonix-javalogin-app'
                    sh 'docker ps'
                    sh 'java -jar /target/dptweb.war'
                }
            }
        }
    }
    
    post {
        success {
            emailext subject: 'Jenkins Build Notification - Success',
                      body: 'Your Jenkins build was successful.',
                      to: 'jofranco1203@gmail.com'
        }
        failure {
            emailext subject: 'Jenkins Build Notification - Failure',
                      body: 'Your Jenkins build was not successful.',
                      to: 'jofranco1203@gmail.com'
        }
    }
}
