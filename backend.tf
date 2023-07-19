terraform {
  backend "gcs" {
    bucket = "argo-workflow-poc-tfstate"
  }
}
