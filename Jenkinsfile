pipeline {
    agent any
    stages {
        stage('checkout') {
            steps {
               checkout scmGit(branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[credentialsId: 'jenkins-github-private', url: 'git@github.com:santonix/javalogin-app.git']]) 
            }
     
        
        }
    }


}
