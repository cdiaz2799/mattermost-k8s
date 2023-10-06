resource "kubernetes_service" "loadbalancer" {
  metadata {
    name      = "loadbalancer"
    namespace = kubernetes_namespace.mattermost.metadata[0].name
  }
  spec {
    port {
      port        = 80
      target_port = 8065
      protocol    = "TCP"
    }
    type = "LoadBalancer"
    selector = {
      app = "mattermost"
    }
  }
}
