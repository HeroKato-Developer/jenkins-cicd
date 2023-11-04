pipeline {
    environment {
    registry = "herokatodev/test-node"
    registryCredential = 'docker-login'
    dockerImage = ''
    dockerImageLatest = ''
    }

    agent any
    stages {

          stage('Build') {      
            steps {
                    echo 'finish Build'
                    // sh 'node --version'
                    // sh 'npm install' 
                }
            }

            stage('Building Docker Image') {
                steps {
                    script {
                        dockerImage = docker.build registry + ":$BUILD_NUMBER"
                        dockerImageLatest = dockerImage.tag("$registry:latest")
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
            
            stage('Exec Restart') {
                // agent any
                steps{
                  sh "chmod +x -R ./kubernetes/restart.sh"
                  sh "./kubernetes/restart.sh"
                }
            }

            // OK
            // stage('MicroK8s') {
            //     // agent any
            //     steps{

            //       sh "microk8s status"
            //       sh "microk8s kubectl rollout restart -n devops-tools deployment test-node"
            //     }
            // }
        }
    }

