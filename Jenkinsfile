pipeline {
    agent any
    stages {
        stage('checkout') {
            steps {
               checkout scmGit(branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[credentialsId: 'jenkins-github-private', url: 'git@github.com:santonix/javalogin-app.git']]) 
            }
     
        
        }

        stage('build') {
            steps {
                sh 'mvn clean install -DskipTests=true '
            }

        }

        stage('TEST') {
            steps {
                sh 'mvn test '
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
                      body: 'Your Jenkins build failed.',
                      to: 'jofranco1203@gmail.com'
        }
    }
    


}
