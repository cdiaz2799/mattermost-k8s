resource "digitalocean_project" "mattermost" {
  name        = "mattermost"
  description = "Mattermost Deployed in Kubernetes"
}





data "digitalocean_vpc" "vpc" {
  name = var.do_vpc
}