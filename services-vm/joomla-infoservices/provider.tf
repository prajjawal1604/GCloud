terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "5.16.0"
    }
  }
}

provider "google" {
  # Configuration options
  project = "devops-test-ford"
  # region = "asia-south1"
  # zone = "asia-south1-c"
  credentials = "devops-test-ford.json"
}