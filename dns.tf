data "cloudflare_zone" "zone" {
  name = var.cloudflare_zone
}

resource "cloudflare_record" "dns" {
  zone_id = data.cloudflare_zone.zone.zone_id
  name    = "mattermost"
  value   = kubernetes_service.loadbalancer.status.0.load_balancer.0.ingress.0.ip
  type    = "A"
  proxied = true
}

output "mattermost_dns" {
  value       = cloudflare_record.dns.hostname
  description = "Hostname for Mattermost"
}
