# resource "kubernetes_manifest" "mattermost-installation" {
#   manifest = {
#     apiVersion = "installation.mattermost.com/v1beta1"
#     kind       = "Mattermost"

#     metadata = {
#       name      = "mattermost"
#       namespace = kubernetes_namespace.mattermost.metadata[0].name
#     }

#     spec = {
#       version = var.mattermost_version
#       size = "100users"

#       ingress = {
#         enabled = "true"
#         host    = var.fqdn
#         annotations = {
#           "kubernetes.io/ingress.class" = "nginx"
#         }
#       }
#     }
#   }
# }
