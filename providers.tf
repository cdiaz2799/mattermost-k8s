provider "digitalocean" {
  token             = var.do_token
  spaces_access_id  = var.spaces_access_id
  spaces_secret_key = var.spaces_secret_key
}

provider "kubernetes" {
  host                   = digitalocean_kubernetes_cluster.mattermost-k8s.endpoint
  token                  = digitalocean_kubernetes_cluster.mattermost-k8s.kube_config[0].token
  cluster_ca_certificate = base64decode(digitalocean_kubernetes_cluster.mattermost-k8s.kube_config[0].cluster_ca_certificate)
}

provider "helm" {
  kubernetes {
    host                   = digitalocean_kubernetes_cluster.mattermost-k8s.endpoint
    token                  = digitalocean_kubernetes_cluster.mattermost-k8s.kube_config[0].token
    cluster_ca_certificate = base64decode(digitalocean_kubernetes_cluster.mattermost-k8s.kube_config[0].cluster_ca_certificate)
  }
}

provider "http" {}

provider "kubectl" {
  host                   = digitalocean_kubernetes_cluster.mattermost-k8s.endpoint
  token                  = digitalocean_kubernetes_cluster.mattermost-k8s.kube_config[0].token
  cluster_ca_certificate = base64decode(digitalocean_kubernetes_cluster.mattermost-k8s.kube_config[0].cluster_ca_certificate)
  load_config_file       = false
}

provider "onepassword" {
  url   = var.op_url
  token = var.op_token
}

data "onepassword_item" "cf_token" {
  vault = data.onepassword_vault.Vault.uuid
  title = "Cloudflare API Token"
}

provider "cloudflare" {
  api_token = data.onepassword_item.cf_token.section[0].field[0].value

}
