data "http" "do-nginx" {
  url = "https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.8.2/deploy/static/provider/do/deploy.yaml"
}

resource "kubectl_manifest" "nginx-ingress" {
  yaml_body = data.http.do-nginx.response_body
}
