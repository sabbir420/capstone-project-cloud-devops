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
         stage('Build and Push Docker Image') {
              steps {
                  withDockerRegistry([url: "", credentialsId: "docker-hub"]) {
                      sh 'docker build -t sabbir33/udacity-capstone-project .'
                      sh "docker tag sabbir33/udacity-capstone-project"
                      sh 'docker push sabbir33/udacity-capstone-project'
                  }
              }
         }

     }
}
