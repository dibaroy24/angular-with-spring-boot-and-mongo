pipeline{
    agent any
    // tools{
    //     maven 'maven3'
    //     jdk 'jdk8'
    // }
    stages{
        stage('Initialize'){
            steps{
                sh 'chmod 777 /c/WINDOWS/system32/config/systemprofile/AppData/Local/Jenkins/.jenkins'
            }
        }
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
                    junit '**/build/test-reports/*.xml'
                }
            }
        }
    }
}