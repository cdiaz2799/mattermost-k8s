terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = ">= 2.30.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.0.0"
    }
    http = {
      source  = "hashicorp/http"
      version = ">= 3.4.0"
    }
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = ">= 1.14.0"
    }
    onepassword = {
      source  = "1Password/onepassword"
      version = "1.2.0"
    }
  }
}

provider "digitalocean" {
  token = var.do_token
}

provider "kubernetes" {
  host                   = digitalocean_kubernetes_cluster.mattermost-k8s.endpoint
  token                  = digitalocean_kubernetes_cluster.mattermost-k8s.kube_config[0].token
  cluster_ca_certificate = base64decode(digitalocean_kubernetes_cluster.mattermost-k8s.kube_config[0].cluster_ca_certificate)
}
provider "http" {

}

provider "kubectl" {
  host                   = digitalocean_kubernetes_cluster.mattermost-k8s.endpoint
  token                  = digitalocean_kubernetes_cluster.mattermost-k8s.kube_config[0].token
  cluster_ca_certificate = base64decode(digitalocean_kubernetes_cluster.mattermost-k8s.kube_config[0].cluster_ca_certificate)
}

provider "onepassword" {
  url   = var.op_url
  token = var.op_token
}
