resource "google_compute_instance" "riouxsyl17-etcd1" {
  name         = "riouxsyl17-etcd1"
  machine_type = "f1-micro"
  zone         = "us-east1-b"

  disk {
    image = "coreos-cloud/coreos-stable"
  }

  network_interface {
    subnetwork = "${google_compute_subnetwork.east1-riouxsyl17-backend.name}"
    access_config {

    }
  }
}

resource "google_compute_instance" "riouxsyl17-etcd2" {
  name         = "riouxsyl17-etcd2"
  machine_type = "f1-micro"
  zone         = "us-east1-b"

  disk {
    image = "coreos-cloud/coreos-stable"
  }

  network_interface {
    subnetwork = "${google_compute_subnetwork.east1-riouxsyl17-backend.name}"
    access_config {

    }
  }
}

resource "google_compute_instance" "riouxsyl17-etcd3" {
  name         = "riouxsyl17-etcd3"
  machine_type = "f1-micro"
  zone         = "us-east1-b"

  disk {
    image = "coreos-cloud/coreos-stable"
  }

  network_interface {
    subnetwork = "${google_compute_subnetwork.east1-riouxsyl17-backend.name}"
    access_config {

    }
  }
}
