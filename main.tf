provider "google" {
  project = "logging-demo-349512"
  region  = "eu"
}

resource "google_logging_project_sink" "log_writer" {
  name        = "log_writer-sink"
  description = "route log files to the archive GCS Bucket"
  destination = "storage.googleapis.com/${google_storage_bucket.logfile_archives.name}"
  filter      = "resource.type = gce_instance AND resource.labels.instance_id = \"${google_compute_instance.my-logged-instance.instance_id}\""

  unique_writer_identity = true
}

resource "google_project_iam_binding" "demo_log_writer" {
  project = var.project_id
  role    = "roles/storage.objectCreator"

  members = [
    google_logging_project_sink.log_writer.writer_identity
  ]
}