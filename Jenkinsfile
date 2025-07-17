pipeline {
    agent any

    tools {
        maven 'Maven'
        jdk   'JDK17'
    }

    environment {
        SUDO_PASS = credentials('ANSIBLE_SUDO_PASSWORD')
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
                // Note: we open a triple‑double‑quote block so we can embed single‑quotes below
                sh """
                   ansible-playbook -i inventory.ini deploy.yml -b \\
                     --extra-vars 'jenkins_workspace=${WORKSPACE} ansible_become_pass=${SUDO_PASS}'
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
