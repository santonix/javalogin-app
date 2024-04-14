pipeline {
    agent any
    stages {
        stage('checkout') {
            steps {
               checkout scmGit(branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[credentialsId: 'jenkins-github-private', url: 'git@github.com:santonix/javalogin-app.git']]) 
            }
     
        
        }
         stage('Build') {
            steps {
                sh 'mvn clean install -DskipTests'
            }
        }

       


        stage('TEST') {
            steps {
                sh 'mvn test '
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
             sh 'docker tag javalogin-app santonix/santonix-javalogin-app'
             script {
               docker.withRegistry('https://index.docker.io/v1/', 'dockerhub-credentials') {
                docker.image('santonix/santonix-javalogin-app').push()
               }
             }
            }
        }

        stage {
            steps {
                sh '''docker run -d -p 8080:9090 santonix/santonix-javalogin-app'
                      docker ps'''
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
            emailext subject: 'Jenkins Build Notification - failure',
                      body: 'Your Jenkins build was not successful.',
                      to: 'jofranco1203@gmail.com'
        }
    }
} 
