<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_cloudflare"></a> [cloudflare](#requirement\_cloudflare) | >= 4.16.0 |
| <a name="requirement_digitalocean"></a> [digitalocean](#requirement\_digitalocean) | >= 2.30.0 |
| <a name="requirement_http"></a> [http](#requirement\_http) | >= 3.4.0 |
| <a name="requirement_kubectl"></a> [kubectl](#requirement\_kubectl) | >= 1.14.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | >= 2.0.0 |
| <a name="requirement_onepassword"></a> [onepassword](#requirement\_onepassword) | >= 1.2.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_cloudflare"></a> [cloudflare](#provider\_cloudflare) | 4.16.0 |
| <a name="provider_digitalocean"></a> [digitalocean](#provider\_digitalocean) | 2.30.0 |
| <a name="provider_http"></a> [http](#provider\_http) | 3.4.0 |
| <a name="provider_kubectl"></a> [kubectl](#provider\_kubectl) | 1.14.0 |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | 2.23.0 |
| <a name="provider_onepassword"></a> [onepassword](#provider\_onepassword) | 1.2.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [cloudflare_record.dns](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/record) | resource |
| [digitalocean_database_cluster.mattermost-db](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/database_cluster) | resource |
| [digitalocean_database_db.mattermost](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/database_db) | resource |
| [digitalocean_database_firewall.mattermost-db](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/database_firewall) | resource |
| [digitalocean_database_user.mattermost-db-user](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/database_user) | resource |
| [digitalocean_kubernetes_cluster.mattermost-k8s](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/kubernetes_cluster) | resource |
| [digitalocean_project.mattermost](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/project) | resource |
| [digitalocean_spaces_bucket.mattermost-s3](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/spaces_bucket) | resource |
| [kubectl_manifest.mattermost-operator](https://registry.terraform.io/providers/gavinbunney/kubectl/latest/docs/resources/manifest) | resource |
| [kubernetes_manifest.mattermost](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/manifest) | resource |
| [kubernetes_namespace.mattermost](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) | resource |
| [kubernetes_namespace.mattermost-operator](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) | resource |
| [kubernetes_secret.mattermost-db](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/secret) | resource |
| [kubernetes_secret.mattermost-s3](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/secret) | resource |
| [kubernetes_service.loadbalancer](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/service) | resource |
| [onepassword_item.mattermost-db](https://registry.terraform.io/providers/1Password/onepassword/latest/docs/resources/item) | resource |
| [cloudflare_zone.zone](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/data-sources/zone) | data source |
| [digitalocean_kubernetes_versions.k8s-versions](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/data-sources/kubernetes_versions) | data source |
| [digitalocean_vpc.vpc](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/data-sources/vpc) | data source |
| [http_http.mattermost-operator](https://registry.terraform.io/providers/hashicorp/http/latest/docs/data-sources/http) | data source |
| [onepassword_item.cf_token](https://registry.terraform.io/providers/1Password/onepassword/latest/docs/data-sources/item) | data source |
| [onepassword_vault.Vault](https://registry.terraform.io/providers/1Password/onepassword/latest/docs/data-sources/vault) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cloudflare_zone"></a> [cloudflare\_zone](#input\_cloudflare\_zone) | Cloudflare Zone / Domain Name | `string` | n/a | yes |
| <a name="input_do_db_size"></a> [do\_db\_size](#input\_do\_db\_size) | Size of DigitalOcean DB Instance | `string` | `"db-s-1vcpu-1gb"` | no |
| <a name="input_do_region"></a> [do\_region](#input\_do\_region) | DigitalOcean Region | `string` | `"sfo3"` | no |
| <a name="input_do_token"></a> [do\_token](#input\_do\_token) | DigitalOcean Token | `string` | n/a | yes |
| <a name="input_do_vpc"></a> [do\_vpc](#input\_do\_vpc) | DigitalOcean VPC Name | `string` | n/a | yes |
| <a name="input_fqdn"></a> [fqdn](#input\_fqdn) | Targetted fully qualified domain name | `string` | n/a | yes |
| <a name="input_mattermost_version"></a> [mattermost\_version](#input\_mattermost\_version) | Version of Mattermost to deploy | `string` | `"9.0"` | no |
| <a name="input_op_token"></a> [op\_token](#input\_op\_token) | Token for 1Password Connect | `string` | n/a | yes |
| <a name="input_op_url"></a> [op\_url](#input\_op\_url) | URL for 1Password Connect | `string` | n/a | yes |
| <a name="input_spaces_access_id"></a> [spaces\_access\_id](#input\_spaces\_access\_id) | DigitalOcean Spaces Access ID | `string` | n/a | yes |
| <a name="input_spaces_secret_key"></a> [spaces\_secret\_key](#input\_spaces\_secret\_key) | DigitalOcean Spaces Secret Key | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cluster_name"></a> [cluster\_name](#output\_cluster\_name) | DigitalOcean Cluster Name |
| <a name="output_mattermost_dns"></a> [mattermost\_dns](#output\_mattermost\_dns) | Hostname for Mattermost |
| <a name="output_s3_bucket_url"></a> [s3\_bucket\_url](#output\_s3\_bucket\_url) | DigitalOcean S3 Bucket |
<!-- END_TF_DOCS -->