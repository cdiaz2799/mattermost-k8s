resource "digitalocean_spaces_bucket" "mattermost-s3" {
  name   = "cdiaz-cloud-mattermost"
  region = var.do_region
}

output "s3_bucket_url" {
  value       = digitalocean_spaces_bucket.mattermost-s3.bucket_domain_name
  description = "DigitalOcean S3 Bucket"
}
