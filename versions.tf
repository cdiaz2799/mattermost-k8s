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
    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.11.0"
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
      version = ">= 1.2.0"
    }
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = ">= 4.16.0"
    }
  }
}
