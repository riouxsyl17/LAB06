resource "google_compute_instance" "riouxsyl17-jumphost" {
  name         = "riouxsyl17-jumphost"
  machine_type = "f1-micro"
  zone         = "us-east1-b"

  disk {
    image = "debian-cloud/debian-8"
  }
  
  network_interface {
    subnetwork = "${google_compute_subnetwork.east1-riouxsyl17-public.name}"
    access_config {

    }
  }

  metadata_startup_script = "apt-get -y install apache2 && systemctl start apache2"
}
