pipeline {
  agent any
  
    environment {
		DOCKERHUB_CREDENTIALS = credentials('DockerHub')
	}
    stages {
        stage('Login') {
		    steps {
                sh 'echo $DOCKERHUB_CREDENTIALS_USR'
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW'
		        sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR -p $DOCKERHUB_CREDENTIALS_PSW'
			}
		}
        stage('Build&Push Image') {
            steps {
                sh 'docker build -t desaiakshay92/flask_jenkins .'
		sh 'docker push desaiakshay92/flask_jenkins'
            }
        }
        stage('Run Image') {
            steps {
                sh 'docker run -d -p 8020:9191 --name flask_container desaiakshay92/flask_jenkins'
            }
        }
        
        stage('Test') {
            steps {
                echo 'Successfully Pushed'
            }
        }
    }
    }