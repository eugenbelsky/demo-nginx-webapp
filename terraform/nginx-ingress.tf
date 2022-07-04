resource "helm_release" "nginx-ingress" {
  name             = local.nginx_release
  repository       = local.nginx_repo
  chart            = local.nginx_chart
  namespace        = local.nginx_namespace
  create_namespace = true
  atomic           = true

  depends_on = [
    google_container_cluster.primary
  ]
}
