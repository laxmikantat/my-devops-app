pipeline {
  agent any

  environment {
    IMAGE = "my-devops-app:${BUILD_NUMBER}"
    CONTAINER_NAME = "my-devops-app"
  }

  stages {
    stage('Checkout') {
      steps {
        git 'https://github.com/laxmikantat/my-devops-app.git'
      }
    }

    stage('Build Docker Image') {
      steps {
        sh 'docker build -t $IMAGE .'
      }
    }

    stage('Stop Old Container') {
      steps {
        script {
          sh """
            if [ \$(docker ps -q -f name=$CONTAINER_NAME) ]; then
              docker stop $CONTAINER_NAME
              docker rm $CONTAINER_NAME
            fi
          """
        }
      }
    }

    stage('Run New Container') {
      steps {
        sh 'docker run -d --name $CONTAINER_NAME -p 3000:3000 $IMAGE'
      }
    }
  }
}

