locals {
  gke_project            = "569001775650"
  gke_cluster_name       = "demo-nginx-webapp-cluster"
  gke_cluster_region     = "europe-west3"
  gke_cluster_zone       = "europe-west3-a"
  gke_cluster_node_count = "3"
  gke_cluster_sa         = "demo-account"
  gke_cluster_labels = {
    owner   = "eugen"
    purpose = "demo"
  }
  gke_cluster_tags = ["eugen", "demo"]

  cm_namespace = "cert-manager"
  cm_chart     = "cert-manager"
  cm_repo      = "https://charts.jetstack.io"
  cm_version   = "v1.2.0"
  cm_release   = "cert-manager"
}
