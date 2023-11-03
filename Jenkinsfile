pipeline{  
  environment {
    registry = "<Your-registry-username>/node-helloworld"
    registryCredential = '<dockerhub_credentials_id_in_jenkins>'
    dockerImage = ''
  }

  tools { nodejs "nodejs" }
  agent { label 'master' }
    stages {
		stage('Test npm') {
			steps {
				sh """
				npm --version
				"""
			}
		}

        stage('Build'){
           steps{
                // withNPM(npmrcConfig:'my-custom-npmrc') {
                //     echo "Performing npm build..."
                //     sh 'npm install'
                // }
              script{
                sh 'npm install'
              } 
           }   
        }
        stage('Building image') {
            steps{
                script {
                  dockerImage = docker.build registry + ":latest"
                 }
             }
          }
          stage('Push Image') {
              steps{
                  script {
                       docker.withRegistry( '', registryCredential){                            
                       dockerImage.push()
                      }
                   }
                } 
           }
           stage('Deploying into k8s'){
            steps{
                sh 'kubectl apply -f deployment.yml' 
            }
        }
    }
}