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
                sh 'docker build -t 8485012281/jenkins .'
		sh 'docker push 8485012281/jenkins'
            }
        }
        stage('Run Image') {
            steps {
                sh 'docker run -d -p 8020:9191 --name flask_container 8485012281/jenkins'
            }
        }
        
        stage('Test') {
            steps {
                echo 'Successfully Pushed and deploy successfully'
            }
        }
        stage('Upload Artifact to artifactory'){
            environment{
                CI = true
                
                PASS = credentials('pass')
            }
            steps{
                sh 'curl -u jenkins:${PASS} -T /var/lib/jenkins/workspace/pipe2/app.py "http://192.168.59.1:8082/artifactory/jenkins/"'
            }
            post{
                success{
                    echo 'Succefully uploaded to jfrog artifact'
                }
            }
        }	    
	    
    }
    }
