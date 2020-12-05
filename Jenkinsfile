pipeline {  
  environment {
    registry = "saurabhvaj13/flaskhello"
    registryCredential = 'saurabhDockerHub'
  }
  agent any  
    stages {
        stage('Run Lint') {
            parallel {
                stage('Lint Check Python Code') {
                    steps{
                        ws("/jenkins_home/workspace/$JOB_NAME") {
                            git 'https://github.com/dummyapp/flaskhello.git'
                            script {
                                sh "echo The job name is: $JOB_NAME"
                                sh "docker run --rm -v ${ABSOLUTE_WORKSPACE}${WORKSPACE}/hello.py:/code/hello.py pylint:test"
                            }
                        }
                    }
                }
                stage('Lint Check Dockerfile') {
                    steps{
                        script {
                            sh "docker run --rm -i hadolint/hadolint < ./Dockerfile"
                        }
                    }
                }
            }
        }
        stage('Compiling Code') {
            steps{
                script {
                    sh "make compile-app"
                }
        }
    }
    stage('Building image') {
      steps{
        script {
            dockerImage = docker.build registry + ":$BUILD_NUMBER"
            docker.withRegistry('', registryCredential) {   
                dockerImage.push()
            }
        }
      }
    }
    stage('Unit Test Image') {
      steps{
        script {
            dockerImage.inside("--entrypoint=''") {
                sh "python -m unittest discover "
            }
        }
      }
    }
    stage('Push Image') {
        steps{
            script {
                input "Deploy Image?"
                docker.withRegistry( '', registryCredential ) {
                    dockerImage.push 'latest'
                }
            }
        }
    }
  }
}
