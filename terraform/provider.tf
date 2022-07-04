
provider "google" {
  project = local.gke_project
  region  = local.gke_cluster_region
  zone    = local.gke_cluster_zone
}
terraform {
  backend "gcs" {
    bucket = "server-client-tf"
    prefix = "terraform/state"
  }
  required_providers {
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = ">= 1.7.0"
    }
  }
}
