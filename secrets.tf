# Retrieve Vault
data "onepassword_vault" "Vault" {
  name = "Infrastructure Secrets"
}

data "onepassword_item" "mattermost-db-creds" {
  vault = data.onepassword_vault.Vault.uuid
  title = "Mattermost Database"
}

# Update 1Password Item
resource "onepassword_item" "mattermost-db" {
  vault = data.onepassword_vault.Vault.uuid
  title = data.onepassword_item.mattermost-db-creds.title

  category = "database"
  type     = "postgresql"

  hostname   = digitalocean_database_cluster.mattermost-db.private_host
  database   = digitalocean_database_db.mattermost.name
  port       = digitalocean_database_cluster.mattermost-db.port
  username   = digitalocean_database_user.mattermost-db-user.name
  password   = digitalocean_database_cluster.mattermost-db.private_uri ## applies connection string to masked password field
  url        = digitalocean_database_cluster.mattermost-db.host
  depends_on = [digitalocean_database_user.mattermost-db-user]
}
