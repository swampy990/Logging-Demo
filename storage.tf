resource "google_storage_bucket" "logfile_archives" {
  name          = "log_archive_store"
  location      = var.region
  force_destroy = true

  lifecycle_rule {
    condition {
      age = 1
    }
    action {
      type          = "SetStorageClass"
      storage_class = "Coldline"
    }
  }
  lifecycle_rule {
    condition {
      age = 2

    }
    action {
      type          = "SetStorageClass"
      storage_class = "Archive"

    }
  }
  lifecycle_rule {
    condition {
      age = 3
    }
    action {
      type = "Delete"
    }
  }
}