# Create Database User
resource "digitalocean_database_user" "mattermost-db-user" {
  cluster_id = digitalocean_database_cluster.mattermost-db.id
  name       = "mmuser"
}

# Create Database
resource "digitalocean_database_db" "mattermost" {
  cluster_id = digitalocean_database_cluster.mattermost-db.id
  name       = "mattermost"
}

## Create Cluster
resource "digitalocean_database_cluster" "mattermost-db" {
  name                 = "mattermost-db"
  region               = var.do_region
  project_id           = digitalocean_project.mattermost.id
  private_network_uuid = data.digitalocean_vpc.vpc.id

  engine     = "pg"
  version    = "15"
  size       = var.do_db_size
  node_count = 1
}

## Setup Firewall
resource "digitalocean_database_firewall" "mattermost-db" {
  cluster_id = digitalocean_database_cluster.mattermost-db.id

  rule {
    type = "k8s"
    value = digitalocean_kubernetes_cluster.mattermost-k8s.id
  }
}