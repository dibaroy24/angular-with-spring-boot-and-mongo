pipeline{
    agent any
    tools{
        maven 'maven3'
        jdk 'jdk8'
        mongo 'mongodb3'
    }
    stages{
        stage('Checking out git repo'){
            steps{
                checkout([$class: 'GitSCM', branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[credentialsId: 'github_credentials', url: 'https://github.com/dibaroy24/angular-with-spring-boot-and-mongo.git']]])
            }
        }
        stage('Build'){
            steps{
                withMaven{
                    sh 'mvn clean verify'
                }
            }
            post{
                success{
                    junit '**/target/surefire-reports/TEST-*.xml'
                    archiveArtifacts 'target/*.jar'
                }
            }
        }
    }
}