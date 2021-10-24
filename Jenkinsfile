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
<<<<<<< HEAD
                // withMaven{
                //     sh 'mvn clean verify'
                // }
                def mvnHome = tool name: 'maven', type: 'maven'
                def mvnCMD = "${mvnHome}/bin/mvn "
                sh "${mvnCMD} clean package"
=======
                sh 'mvn -B -DskipTests clean package'
                // withMaven{
                //     sh 'mvn clean verify'
                // }
            }
        }
        stage('Test'){
            steps{
                sh 'mvn test'
>>>>>>> refs/remotes/origin/master
            }
            post{
                always{
                    junit 'target/surefire-reports/*.xml'
                }
            }
        }
<<<<<<< HEAD
        stage('Docker Build'){
            steps{
                // docker.build('gs-spring-boot-docker')     
                azureCLI commands: [[exportVariablesString: '', script: 'az acr build --image app/gs-spring-boot-docker:v1 --registry harmonicpracticeacr --file Dockerfile . ']], principalCredentialId: 'jenkins_azure_service_principle'           
            }
        }
        stage('Docker Push'){
            steps{
                sh 'docker push harmonicpracticeacr.azurecr.io/gs-spring-boot-docker:v1'
            }
        }
        stage('Deploy to Kubernetes'){
            sh 'kubectl apply -f K8sDeploy.yaml'
        }
=======
        stage('Build Docker Image'){
			steps {
				withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: 'dockerhub', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD']]){
					sh '''
						docker build -t dibaroy/angular_with_spring_boot_and_mongo_app .
					'''
				}
			}
		}
        stage('Push Image To Dockerhub') {
			steps {
				withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: 'dockerhub', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD']]){
					sh '''
						docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD
						docker push dibaroy/angular_with_spring_boot_and_mongo_app
					'''
				}
			}
		}
>>>>>>> refs/remotes/origin/master
    }
}