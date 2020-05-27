pipeline {
     agent any
     stages {
         stage('Build') {
              steps {
                  sh 'echo Building...'
              }
         }
         stage('Lint HTML') {
              steps {
                  sh 'tidy -q -e *.html'
              }
         }
         stage('Build Docker Image') {
              steps {
                  sh 'docker build -t capstone-project-cloud-devops .'
              }
         }
         stage('Push Docker Image') {
              steps {
                  withDockerRegistry([url: "", credentialsId: "docker-hub"]) {
                      sh "docker tag capstone-project-cloud-devops sabbir33/capstone-project-cloud-devops"
                      sh 'docker push sabbir33/capstone-project-cloud-devops'
                  }
              }
         }
         stage('Deployment') {
              steps {
                //    sshagent(['kube-machine']) {
                //       sh "scp -o StrictHostKeyChecking=no deployment/deployment.yml ec2-user@34.219.17.95:/home/ec2-user/"
                //       script{
                //           try{
                //               sh "ssh ec2-user@34.219.17.95 kubectl apply -f ."
                //           }
                //           catch(error){
                //               sh "ssh ec2-user@34.219.17.95 kubectl create -f ."
                //           }
                //       }
                //    }
                   withAWS(credentials: "aws") {
                      sh 'kubectl apply -f deployment/deployment.yml'
                   }
              }
         }
         stage('Clean Up') {
              steps {
                  sh 'docker system prune'
              }
         }
     }
}
