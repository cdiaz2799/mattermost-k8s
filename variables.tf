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
