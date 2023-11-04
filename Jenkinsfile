// Jenkinsfile

// pipeline {
//   agent {
//     kubernetes {
//       // this label will be the prefix of the generated pod's name
//       label 'jenkins-agent-my-app'
//       yaml """
// apiVersion: v1
// kind: Pod
// metadata:
//   labels:
//     component: ci
// spec:
//   containers:
//     - name: docker
//       image: docker
//       command:
//         - cat
//       tty: true
//       volumeMounts:
//         - mountPath: /var/run/docker.sock
//           name: docker-sock
//     - name: kubectl
//       image: lachlanevenson/k8s-kubectl:v1.14.0 # use a version that matches your K8s version
//       command:
//         - cat
//       tty: true
//   volumes:
//     - name: docker-sock
//       hostPath:
//         path: /var/run/docker.sock
// """
//     }
//   }

  // stages {
  //   stage('Build image') {
  //     steps {
  //       container('docker') {
  //         sh "docker build -t herokatodev/test-node:latest ."
  //         sh "docker push herokatodev/test-node:latest"
  //       }
  //     }
  //   }

  //   stage('Deploy') {
  //     steps {
  //       container('kubectl') {
  //         sh "kubectl delete -f ./kubernetes/deployment.yaml"
  //         sh "kubectl apply -f ./kubernetes/deployment.yaml"
  //         sh "kubectl apply -f ./kubernetes/service.yaml"
  //       }
  //     }
  //   }
  // }
// }

pipeline{

  // agent {
  //       docker { image 'docker' }
  //   }


  // agent none
  // agent {         docker { image 'node' } }
  agent { dockerfile true }
  stages {

    // stage('Test Node') {
    //   steps {
    //       sh 'node --version'
    //   }
    // }

    // stage('Test Docker 1') {
    //   steps {
    //       sh 'docker --version'
    //   }
    // }

    // stage('Test Docker 2') {
    //   steps {
    //       container('docker') {
    //       sh 'docker --version'
    //     }
    //   }
    // }

        stage('Build') { 
                
            steps {
                sh 'node --version'
                sh 'npm install' 
            }
        }
        
    //     stage('Build and Push Docker Image') {
    //         steps {
    //             script {
    //                 def imageTag = "your-docker-registry-url/your-image-name:latest"
    //                 docker.build(imageTag, "--file Dockerfile .")
    //                 docker.withRegistry('https://${DOCKER_REGISTRY}', 'docker-registry-credential-id') {
    //                     docker.image(imageTag).push()
    //                 }
    //             }
    //         }

    // stage('Build image') {
    //   steps {
    //     container('docker') {
    //       sh "docker build -t herokatodev/test-node:latest ."
    //       sh "docker push herokatodev/test-node:latest"
    //     }
    //   }
    // }

      stage('Build and Push Docker Image') {
            steps {
                script {
                    def imageTag = "herokatodev/test-node:latest"
                    docker.build(imageTag, "--file Dockerfile .")
                    docker.image(imageTag).push()
                    // docker.withRegistry('https://${DOCKER_REGISTRY}', 'docker-registry-credential-id') {
                    //     docker.image(imageTag).push()
                    // }
                }
            }
        }

    stage('Deploy') {
      steps {

        container('kubectl') {
          sh "kubectl delete -f ./kubernetes/deployment.yaml"
          sh "kubectl apply -f ./kubernetes/deployment.yaml"
        }
      }
    }
  }
}