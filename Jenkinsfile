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
         stage('Deploying') {
              steps{
                  echo 'Deploying to AWS...'
                  withAWS(credentials: 'aws', region: 'us-west-2') {
                      sh "aws eks --region us-west-2 update-kubeconfig --name CapstoneEKS-yFFNEQVmAsvG"
                      sh "kubectl apply -f aws/aws-auth-cm.yaml"
                      //sh "kubectl set image capstone-project-cloud-devops capstone-project-cloud-devops=capstone-project-cloud-devops:latest"
                      sh "kubectl apply -f deployment/deployment.yml"
                      sh "kubectl get nodes"
                      sh "kubectl get pod -o wide"
                      sh "kubectl get services -o wide"
                      sh "kubectl describe svc capstone-project-cloud-devops"
                      //sh "kubectl expose deployment capstone-project-cloud-devops --type=LoadBalancer --name=my-service"
                      //sh "kubectl get services my-service"
                  }
              }
        }
        stage("Cleaning up") {
              steps{
                    echo 'Cleaning up...'
                    sh "docker system prune"
              }
        }
     }
}
