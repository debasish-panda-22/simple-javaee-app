pipeline {
    agent any

    tools {
        maven 'Maven'
        jdk 'JDK17'
        // (optional) if you manage Ansible via Jenkins Tool Installers:
        // ansible 'Ansible'
    }

    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/debasish-panda-22/simple-javaee-app.git', branch: 'master'
            }
        }

        stage('Debug') {
            steps {
                sh 'echo $PATH'
                sh 'which mvn'
                sh 'mvn --version'
            }
        }

        stage('Build') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage('Deploy') {
            steps {
                // Use -b to become root (sudo) when copying into Tomcat's webapps
                sh '''
                   ansible-playbook -i inventory.ini deploy.yml \
                     -b \
                     --extra-vars "jenkins_workspace=${WORKSPACE}"
                '''
            }
        }
    }

    post {
        always {
            // Archive your WAR and clean workspace
            archiveArtifacts artifacts: 'target/*.war', allowEmptyArchive: true
            cleanWs()
        }
    }
}
