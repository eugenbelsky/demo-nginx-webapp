data "kubectl_filename_list" "cm-crds" {
  pattern = "./crds/cert-manager.crds.yaml"
}


resource "kubectl_manifest" "cm-crds" {
  count              = length(data.kubectl_filename_list.cm-crds.matches)
  override_namespace = local.cm_namespace
  yaml_body          = file(element(data.kubectl_filename_list.cm-crds.matches, count.index))
  depends_on = [
    google_container_cluster.primary
  ]
}

resource "helm_release" "cert-manager" {
  name             = local.cm_release
  repository       = local.cm_repo
  chart            = local.cm_chart
  version          = local.cm_version
  namespace        = local.cm_namespace
  create_namespace = true
  atomic           = true

  depends_on = [
    kubectl_manifest.cm-crds
  ]
}


# data "kubectl_filename_list" "cm-cluster-issuer" {
#   pattern = "./crds/cluster-issuer.yaml"
# }


# resource "kubectl_manifest" "cm-cluster-issuer" {
#   count              = length(data.kubectl_filename_list.cm-cluster-issuer.matches)
#   override_namespace = local.cm_namespace
#   yaml_body          = file(element(data.kubectl_filename_list.cm-cluster-issuer.matches, count.index))
#   depends_on = [
#     helm_release.cert-manager
#   ]
# }





