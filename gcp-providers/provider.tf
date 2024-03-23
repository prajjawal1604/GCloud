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
  project = "gcp-terraform-414508"
  region = "asia-south1"
  zone = "asia-south1-a"
  credentials = "keys.json"
}