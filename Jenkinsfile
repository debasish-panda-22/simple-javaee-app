pipeline {
    agent any

    tools {
        maven 'Maven'
        jdk   'JDK17'
    }

    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/debasish-panda-22/simple-javaee-app.git',
                    branch: 'master'
            }
        }

        stage('Debug') {
            steps {
                sh '''
                   echo "PATH = $PATH"
                   which mvn
                   mvn --version
                '''
            }
        }

        stage('Build') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage('Deploy') {
            steps {
                sh """
                   ansible-playbook -i inventory.ini deploy.yml -b \\
                     --extra-vars 'jenkins_workspace=${WORKSPACE}'
                """
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
