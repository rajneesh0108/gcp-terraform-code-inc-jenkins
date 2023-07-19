provider "google" {
  credentials = "${file("/jenkins/kaniko-secret.json")}"
  project     = "argo-workflow-poc"
}
