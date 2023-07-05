pipeline {
    agent any
    stages {
        stage("build image") {
            steps {
                script {
                    echo "building the docker image"
                    sh 'docker build . -t bhubanjitsahu/demo-app:todo-app'
                }
            }
        }
        stage("push image") {
            steps {
                script {
                    echo "pushing the docker image"
                    withCredentials([usernamePassword(credentialsId: "dockerHub", passwordVariable: "dockerHubPass", usernameVariable: "dockerHubUser")]) {
                        sh "echo $dockerHubPass | docker login -u $dockerHubUser --password-stdin"
                        sh "docker push bhubanjitsahu/demo-app:todo-app"
                    }
                }
            }
        }
        stage("deploy") {
            steps {
                script {
                    echo "deploying the app"
                }
            }
        }
    }
}
