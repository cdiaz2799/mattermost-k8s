resource "helm_release" "do-mattermost" {
  name             = "gitlab-agent"
  namespace        = "gitlab-agent"
  repository       = "https://charts.gitlab.io"
  chart            = "gitlab-agent"
  create_namespace = true
  set {
    name  = "image.tag"
    value = "v16.5.0-rc2"
  }
  set {
    name  = "config.token"
    value = var.gitlab_agent_token
  }
  set {
    name  = "config.kasAddress"
    value = "wss://kas.gitlab.com"
  }
}
