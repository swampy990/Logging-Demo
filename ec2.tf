resource "google_compute_instance" "my-logged-instance" {
  name         = "my-instance"
  machine_type = "e2-micro"
  zone         = "europe-west2-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = "default"

    access_config {
    }
  }
}