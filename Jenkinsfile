def CLUSTER_CREDENTIALS = 'kubernetes'
def KUBECTL_POD = """
apiVersion: v1
kind: Pod
spec:
  containers:
  - name: kubectl
    image: lachlanevenson/k8s-kubectl:v1.15.9
    command:
    - cat
    tty: true
"""

pipeline {
    environment {
    registry = "herokatodev/test-node"
    registryCredential = 'docker-login'
    dockerImage = ''
    dockerImageLatest = ''
    }

    agent any
    stages {
            // stage('Cloning our Git') {
            //     steps {
            //       git 'git@github.com:HeroKato-Developer/jenkins-cicd.git'
            //     }
            // }

          stage('Build') {  
            // agent { dockerfile true }          
            steps {
                    echo 'finish Build'
                    // sh 'node --version'
                    // sh 'npm install' 
                }
            }

            stage('Building Docker Image') {
                // agent any
                steps {
                    script {
                        dockerImage = docker.build registry + ":$BUILD_NUMBER"
                        dockerImageLatest = docker.build registry + ":latest"
                    }
                }
            }

            stage('Deploying Docker Image to Dockerhub') {
                // agent any
                steps {
                    script {
                        docker.withRegistry('', registryCredential) {
                        dockerImage.push()
                        dockerImageLatest.push()
                        }
                    }
                }
            }

            stage('Cleaning Up') {
                // agent any
                steps{
                  sh "docker rmi --force $registry:$BUILD_NUMBER"
                  sh "docker rmi --force $registry:latest"
                }
            }
            
            stage('Kubernetes') {
                // agent any
                steps{
                  sh "sudo kubernetes/restart.sh"
                }
            }
        }
    }

