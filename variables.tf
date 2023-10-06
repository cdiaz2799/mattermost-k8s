variable "do_token" {
  description = "DigitalOcean Token"
  type        = string
  sensitive   = true
}

variable "do_region" {
  description = "DigitalOcean Region"
  type        = string
  sensitive   = false
  default     = "sfo3"
}

variable "do_vpc" {
  description = "DigitalOcean VPC Name"
  type        = string
  sensitive   = false
}

variable "do_db_size" {
  description = "Size of DigitalOcean DB Instance"
  type        = string
  sensitive   = false
  default     = "db-s-1vcpu-1gb"
}


variable "op_url" {
  description = "URL for 1Password Connect"
  type        = string
  sensitive   = true
}

variable "op_token" {
  description = "Token for 1Password Connect"
  type        = string
  sensitive   = true
}

variable "fqdn" {
  description = "Targetted fully qualified domain name"
  type        = string
  sensitive   = false
}

variable "mattermost_version" {
  description = "Version of Mattermost to deploy"
  type        = string
  sensitive   = false
  default     = "9.0"
}

variable "spaces_access_id" {
  description = "DigitalOcean Spaces Access ID"
  type        = string
  sensitive   = true
}

variable "spaces_secret_key" {
  description = "DigitalOcean Spaces Secret Key"
  type        = string
  sensitive   = true
}

variable "cloudflare_zone" {
  description = "Cloudflare Zone / Domain Name"
  type        = string
  sensitive   = false
}

variable "gitlab_agent_token" {
  description = "Gitlab Agent Access Token"
  type        = string
  sensitive   = true
}
