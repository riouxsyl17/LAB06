resource "google_compute_instance" "riouxsyl17-vault" {
  name         = "riouxsyl17-vault"
  machine_type = "f1-micro"
  zone         = "us-east1-b"

  disk {
    image = "coreos-cloud/coreos-stable"
  }

  network_interface {
    subnetwork = "${google_compute_subnetwork.east1-riouxsyl17-public.name}"
    access_config {

    }
  }
}
