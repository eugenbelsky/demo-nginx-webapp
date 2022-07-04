resource "google_service_account" "gke_cluster_account" {
  account_id   = local.gke_cluster_sa
  display_name = local.gke_cluster_sa
}
resource "google_container_cluster" "primary" {
  name               = local.gke_cluster_name
  location           = local.gke_cluster_zone
  initial_node_count = local.gke_cluster_node_count
  node_config {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.ååå
    service_account = google_service_account.gke_cluster_account.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
    labels = local.gke_cluster_labels
    tags   = local.gke_cluster_tags
  }
}
