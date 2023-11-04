pipeline {
    environment {
    registry = "herokatodev/test-node"
    registryCredential = 'docker-login'
    dockerImage = ''
    dockerImageLatest = ''
    }

    agent none
    stages {
            // stage('Cloning our Git') {
            //     steps {
            //     git 'git@github.com:HeroKato-Developer/jenkins-cicd.git'
            //     }
            // }

          stage('Build') {  
            agent { dockerfile true }          
            steps {
                    echo 'finish Build'
                    // sh 'node --version'
                    // sh 'npm install' 
                }
            }

            stage('Building Docker Image') {
                agent any
                steps {
                    script {
                        dockerImage = docker.build registry + ":$BUILD_NUMBER"
                        dockerImageLatest = docker.build registry + ":latest"
                    }
                }
            }

            stage('Deploying Docker Image to Dockerhub') {
                agent any
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
                agent any
                steps{
                  sh "docker rmi --force $registry:$BUILD_NUMBER"
                  sh "docker rmi --force $registry:latest"
                }
            }
        }
    }