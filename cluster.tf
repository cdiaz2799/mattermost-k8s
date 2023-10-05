data "digitalocean_kubernetes_versions" "k8s-versions" {
  version_prefix = "1.28."
}

resource "digitalocean_kubernetes_cluster" "mattermost-k8s" {
  name         = "mattermost"
  region       = var.do_region
  vpc_uuid     = data.digitalocean_vpc.vpc.id
  version      = data.digitalocean_kubernetes_versions.k8s-versions.latest_version
  auto_upgrade = true
  ha           = false

  node_pool {
    name = "mattermost-pool"
    size = "s-1vcpu-2gb"
    node_count = 1
  }
}

output "cluster_id" {
  value = digitalocean_kubernetes_cluster.mattermost-k8s.id
}

output "cluster_name" {
  value = digitalocean_kubernetes_cluster.mattermost-k8s.name
}