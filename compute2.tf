resource "google_compute_instance" "riouxsyl17-master" {
  name         = "riouxsyl17-master"
  machine_type = "f1-micro"
  zone         = "us-east1-b"

  disk {
    image = "coreos-cloud/coreos-stable"
  }

  network_interface {
    subnetwork = "${google_compute_subnetwork.east1-riouxsyl17-workload.name}"
    access_config {

    }
  }
}

resource "google_compute_instance_template" "riouxsyl17-template-worker" {
  name         = "riouxsyl17-template-worker"
  machine_type = "f1-micro"
  can_ip_forward = false

  disk {
    source_image = "coreos-cloud/coreos-stable"
    auto_delete = true
    boot = true
  }

  network_interface {
    subnetwork = "${google_compute_subnetwork.east1-riouxsyl17-workload.name}"
  }
}

resource "google_compute_instance_group_manager" "riouxsyl17-grp-mgr" {
  name        = "riouxsyl17-grp-mgr"

  base_instance_name = "riouxsyl17-worker"
  instance_template  = "${google_compute_instance_template.riouxsyl17-template-worker.self_link}"
  zone               = "us-east1-b"

}

resource "google_compute_autoscaler" "riouxsyl17-autoscaler" {
  name   = "riouxsyl17-autoscaler"
  zone   = "us-east1-b"
  target = "${google_compute_instance_group_manager.riouxsyl17-grp-mgr.self_link}"

  autoscaling_policy = {
    max_replicas    = 5
    min_replicas    = 2
    cooldown_period = 60

    cpu_utilization {
      target = 0.5
    }
  }
}
