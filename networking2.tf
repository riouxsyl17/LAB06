resource "google_compute_firewall" "riouxsyl17-fw-pub" {
  name    = "riouxsyl17-fw-pub"
  network = "google_compute_network.east1-riouxsyl17-public.name"
  allow {
    protocol = "tcp"
    ports    = ["80"]
  }
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  allow {
    protocol = "tcp"
    ports    = ["443"]
  }
}

resource "google_compute_firewall" "riouxsyl17-fw-work" {
  name    = "riouxsyl17-fw-work"
  network = "google_compute_network.east1-riouxsyl17-workload.name"
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
      source_ranges = ["172.16.1.0/24"]
}

resource "google_compute_firewall" "riouxsyl17-fw-back1" {
  name    = "riouxsyl17-fw-back1"
  network = "google_compute_network.east1-riouxsyl17-backend.name"
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  allow {
    protocol = "tcp"
    ports    = ["2379"]
  }
  allow {
    protocol = "tcp"
    ports    = ["2380"]
  }
      source_ranges = ["172.16.1.0/24"]
}

resource "google_compute_firewall" "riouxsyl17-fw-back2" {
  name    = "riouxsyl17-fw-back2"
  network = "google_compute_network.east1-riouxsyl17-backend.name"
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  allow {
    protocol = "tcp"
    ports    = ["2379"]
  }
  allow {
    protocol = "tcp"
    ports    = ["2380"]
  }
      source_ranges = ["10.0.1.0/24"]
}
