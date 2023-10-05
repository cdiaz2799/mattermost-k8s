resource "kubernetes_namespace" "mattermost-operator" {
  metadata {
    name = "mattermost-operator"
  }
}

data "http" "mattermost-operator" {
  url = "https://raw.githubusercontent.com/mattermost/mattermost-operator/master/docs/mattermost-operator/mattermost-operator.yaml"
}

resource "kubectl_manifest" "mattermost-operator" {
  override_namespace = kubernetes_namespace.mattermost-operator.metadata[0].name
  yaml_body          = data.http.mattermost-operator.response_body
}
