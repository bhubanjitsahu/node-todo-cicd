pipeline {
    agent any
    stages {
        stage("build image") {
            steps {
                script {
                    echo "building the docker image"
                    sh "docker build . -t todo-app"
                }
            }
        }
        stage("push image") {
           steps {
               script {
                    echo "pushing the docker image"
                    withCredentials([usernamePassword(credentialsId:"dockerHub",passwordVariable:"dockerHubPass",usernameVariable:"dockerHubUser")]){
                    sh "docker tag node-app-test-new ${env.dockerHubUser}/todo-app:latest"
                    sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPass}"
                    sh "docker push ${env.dockerHubUser}/todo-app:latest"
                    
                }
            }
        }
        stage("deploy") {
            steps {
                script {
                    echo "deploying the app"
                   sh "docker run -d --name todo-app -p 8000:8000 todo-app"
                }

            }
        }
    }
}
