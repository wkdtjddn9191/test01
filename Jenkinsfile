pipeline {
    agent any

    tools {
        maven 'Maven3'
    }

    environment {
     dockerHubRegistry = "sungwoojang/test"
     dockerHubRegistryCredential = "docker"
     githubCredential = 'git_hub'
     gitEmail = 'wkdtjddn9191@gmail.com'
     gitName = 'wkdtjddn9191'
    }
    stages {
            
        stage('Checkout Application Git Branch') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*main']], extensions:[],userRemoteCo])
            }
            post {
                failure {
                    echo 'Repository clone failure'
                }
                success{
                    echo 'Repository clone success'
                }
            }
        }

        stage('Maven Jar build'){
            steps {
                sh 'mvn clean install'
            }
            post {
                failure{
                    echo 'Maven war build failure'
                }
                success{
                    echo 'Maven war build success'
                }
            }
        }

        stage('Docker Image build') {
            steps {
                sh "docker build . -t ${dockerHubRegistry}:${currentBuild.number}"
                sh "docker build . -t $(dockerHubRegistry}:latest"
            }
            post {
                failure {
                    echo "docker image build failure"
                    slackSend (color: "#FF0000", message: "Failed: Docker image build")
                }
                success {
                    echo 'Docker image build success'
                    slackSend (color: '#0AC9FF', message: "SUCCESS: Docker image build")
                }
            }
        }

        stage('Dcoker Image Push') {
            steps {
                withDockerRegistry(credentialsId: dockerHubRegistryCredential, url: "") {
                    sh "docker push ${dockerHubRegistry}:{currentBuild.number}"
                    sh "docker push ${dockerHubRegistry}:latest"
                    sleep 10
                }
            }
            post {
                failure {
                    echo 'Docker Image Push failure'
                    sh "docker rmi ${dockerHubRegistry}:${currentBuild.number}"
                    sh "docker rmi ${dockerHubRegistry}:latest"
                    slackSend (color: '#FF000', message: "Failed")
                }
                success {
                    echo 'Docker Imgae Push success'
                    sh "docker rmi ${dockerHubRegistry}:${currrentbuild.number}"
                    sh "docker rmi ${dockerHubRegistry}:latest"
                    slackSend (color: '#0AC9FF' , message: " SUCCESS:Docker Imgae push ")
                }
            }
        }
        stage('K8s Manifest Update'){
            steps {
                git credentialsId: githubCredential,
                    url: "https://github.com/wkdtjddn9191/test01.git"
                    branch: 'main'
                sh "git config --global user.email ${gitemail}"
                sh "git config --global user.name ${gitName}"
                sh "sed -i 's/tomcat:${currentBuild.number}/g' deploy/production.yaml"
                sh "git add ."
                sh "git commit -m 'fix${dockerHubRegistry} ${currentBuild.number} image versioning"
                sh "git branch -M main"
                sh "git remote remove origin"
                sh "git remote add origin git@github.com:wkdtjddn9191/test01.git"
                sh "git push -u origin main"
            }
            post {
                failure {
                    echo 'K8s Manifest Update failure'
                    slackSend (color: 'FF0000', message: "Failed")
                }
                success {
                    echo 'K8s Manifest Update success'
                    slackSend (color: '#0AC9FF', message: "SUCCESS")
                }
            }
        }
    }
}
