pipeline {
    agent any
    tools {
        maven 'Maven' // Must match name in Global Tool Configuration
        jdk 'JDK17'   // Must match name in Global Tool Configuration
    }
    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/debasish-panda-22/simple-javaee-app.git', branch: 'master'
            }
        }
        stage('Build') {
            steps {
                sh 'mvn clean package'
            }
        }
        stage('Deploy') {
            steps {
                sh 'ansible-playbook -i inventory.ini deploy.yml --extra-vars "jenkins_workspace=$WORKSPACE"'
            }
        }
    }
    post {
        always {
            archiveArtifacts artifacts: 'target/*.war', allowEmptyArchive: true
            cleanWs()
        }
    }
}
