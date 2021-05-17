pipeline{
    agent any
    stages{
        stage('Checking out git repo'){
            steps{
                checkout([$class: 'GitSCM', branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[credentialsId: 'github_credentials', url: 'https://github.com/dibaroy24/angular-with-spring-boot-and-mongo.git']]])
            }
        }
        stage('Build'){
            steps{
                sh "mvn -Dmaven.test.failure.ignore=true clean package"
                // withMaven{
                //     sh 'mvn clean verify'
                // }
            }
        }
    }
}