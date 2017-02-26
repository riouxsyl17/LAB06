resource "google_compute_network" "cr460" {
  name                    = "cr460"
  auto_create_subnetworks = "false"
}

resource "google_compute_subnetwork" "east1-riouxsyl17-public" {
  name          = "east1-riouxsyl17-public"
  ip_cidr_range = "172.16.1.0/24"
  network       = "${google_compute_network.cr460.self_link}"
  region        = "us-east1"
}

resource "google_compute_subnetwork" "east1-riouxsyl17-workload" {
  name          = "east1-riouxsyl17-workload"
  ip_cidr_range = "10.0.1.0/24"
  network       = "${google_compute_network.cr460.self_link}"
  region        = "us-east1"
}

resource "google_compute_subnetwork" "east1-riouxsyl17-backend" {
  name          = "east1-riouxsyl17-backend"
  ip_cidr_range = "10.0.2.0/24"
  network       = "${google_compute_network.cr460.self_link}"
  region        = "us-east1"
}
