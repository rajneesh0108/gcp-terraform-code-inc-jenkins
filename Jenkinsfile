pipeline {
  
  agent  {
    kubernetes {
      label 'terraform'  // all your pods will be named with this prefix, followed by a unique id
      idleMinutes 5  // how long the pod will live after no jobs have run on it
    }
  }

    stages {
    stage('Checkout') {
      steps {
        checkout scm
      }
    }
    stage('TF Plan') {
      steps {
        container('terraform') {
          sh 'terraform init'
          sh 'terraform plan -out myplan'
        }
      }      
    }

    stage('Approval') {
      steps {
        script {
          def userInput = input(id: 'confirm', message: 'Apply Terraform?', parameters: [ [$class: 'BooleanParameterDefinition', defaultValue: false, description: 'Apply terraform', name: 'confirm'] ])
        }
      }
    }

    stage('TF Apply') {
      steps {
        container('terraform') {
          sh 'terraform apply -input=false myplan'
        }
      }
    }
    stage('Terraform Output') {
      steps {
        container('terraform') {
          sh 'terraform output'
        }
      }
    } 
  }
    post {
        always {
            sh 'rm -f tfplan'
        }
        success {
            echo "pipeline successful"
        }
        failure {
            echo "pipeline failed :("
        }
    }
}
