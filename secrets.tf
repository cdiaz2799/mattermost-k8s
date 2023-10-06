# Retrieve Vault
data "onepassword_vault" "Vault" {
  name = "Infrastructure Secrets"
}

resource "kubernetes_secret" "mattermost-db" {
  type = "Opaque"

  metadata {
    name      = "mattermost-db-connection"
    namespace = kubernetes_namespace.mattermost.metadata[0].name
  }

  data = {
    "DB_CONNECTION_STRING"    = "postgres://${digitalocean_database_user.mattermost-db-user.name}:${digitalocean_database_user.mattermost-db-user.password}@${digitalocean_database_cluster.mattermost-db.private_host}:${digitalocean_database_cluster.mattermost-db.port}/${digitalocean_database_db.mattermost.name}?sslmode=require"
    "DB_CONNECTION_CHECK_URL" = "postgres://${digitalocean_database_user.mattermost-db-user.name}:${digitalocean_database_user.mattermost-db-user.password}@${digitalocean_database_cluster.mattermost-db.private_host}:${digitalocean_database_cluster.mattermost-db.port}/${digitalocean_database_db.mattermost.name}?sslmode=require"
  }
}

resource "kubernetes_secret" "mattermost-s3" {
  type = "Opaque"

  metadata {
    name      = "do-spaces-s3"
    namespace = kubernetes_namespace.mattermost.metadata[0].name
  }

  data = {
    accesskey = var.spaces_access_id
    secretkey = var.spaces_secret_key
  }
}
