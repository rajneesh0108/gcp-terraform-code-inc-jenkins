pipeline {
agent {
kubernetes {
label 'terraform'
idleMinutes 5
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
def userInput = input(id: 'confirm', message: 'Apply Terraform?', parameters: [booleanParam(name: 'confirm', defaultValue: false)])
}
}
}
stage('TF Apply') {
steps {
container('terraform') {
sh 'terraform apply -input=false ${params.confirm} myplan'
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
echo 'pipeline successful'
}
failure {
echo 'pipeline failed :('
}
aborted {
echo 'pipeline aborted may be due to some reasons related to approval'
}
}
}
