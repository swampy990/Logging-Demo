resource "google_compute_instance" "my-logged-instance" {
  name         = "my-instance"
  machine_type = "e2-micro"
  zone         = "europe-west2-a"

  allow_stopping_for_update = true

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

resource "google_compute_instance" "windows_logtest" {
  name         = "windows-logtest"
  
  # rmO*?VEh)T%$NN;

  machine_type = var.windows_instance_type
  zone         = "europe-west2-a"
  hostname     = "windows-log.example.com"
  tags         = ["rdp", "http"]

  allow_stopping_for_update = true

  boot_disk {
    initialize_params {
      image = var.windows_2022_sku
    }
  }

  network_interface {
    network = "default"
    access_config {

    }
  }
 
}