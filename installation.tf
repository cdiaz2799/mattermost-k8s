resource "kubernetes_manifest" "mattermost" {
  manifest = {
    apiVersion = "installation.mattermost.com/v1beta1"
    kind       = "Mattermost"
    metadata = {
      name      = "mattermost"
      namespace = kubernetes_namespace.mattermost.metadata[0].name
    }
    spec = {
      image = "mattermost/mattermost-team-edition"

      database = {
        external = {
          secret = kubernetes_secret.mattermost-db.metadata[0].name
        }
      }
      fileStore = {
        external = {
          bucket = digitalocean_spaces_bucket.mattermost-s3.name
          secret = kubernetes_secret.mattermost-s3.metadata[0].name
          url    = digitalocean_spaces_bucket.mattermost-s3.endpoint
        }
      }
      ingress = {
        annotations = {
          "kubernetes.io/ingress.class" = "nginx"
        }
        enabled = true
        host    = var.fqdn
      }
      mattermostEnv = [
        {
          name  = "MM_FILESETTINGS_DRIVERNAME"
          value = "amazons3"
        },
        {
          name  = "MM_FILESETTINGS_AMAZONS3SSE"
          value = "true"
        },
        {
          name  = "MM_FILESETTINGS_AMAZONS3ENDPOINT"
          value = digitalocean_spaces_bucket.mattermost-s3.endpoint
        },
        {
          name  = "MM_FILESETTINGS_AMAZONS3SSL"
          value = "true"
        },
        {
          name  = "MM_SQLSETTINGS_DRIVERNAME"
          value = "postgres"
        },
      ]
      size    = "100users"
      version = var.mattermost_version
    }
  }
  depends_on = [kubernetes_secret.mattermost-db, kubernetes_secret.mattermost-s3]
  field_manager {
    force_conflicts = true
  }
}
