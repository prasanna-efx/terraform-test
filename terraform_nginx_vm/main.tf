resource "google_compute_autoscaler" "foobar" {
  name = "my-autoscaler"
  project = "pivpn-342703"
  zone = "us-central1-c"
  target = google_compute_instance_group_manager.foobar.self_link
    autoscaling_policy {
    max_replicas = 5
    min_replicas = 2
    cooldown_period = 60
      cpu_utilization {
      target = 0.5
      }
    }
  }

resource "google_compute_instance_template" "foobar" {
  name = "my-instance-template"
  machine_type = "n1-standard-1"
  can_ip_forward = false
  project = "pivpn-342703"
  tags = ["foo", "bar", "allow-lb-service"]
  disk {
  source_image = data.google_compute_image.centos_7.self_link
  }
  network_interface {
  network = "terraform-network"
  }
  metadata = {
  foo = "bar"
  }
  service_account {
  scopes = ["userinfo-email", "compute-ro", "storage-ro"]
  }
}

resource "google_compute_target_pool" "foobar" {
  name = "my-target-pool"
  project = "pivpn-342703"
  region = "us-central1"
  }

resource "google_compute_instance_group_manager" "foobar" {
  name = "my-igm"
  zone = "us-central1-c"
  project = "pivpn-342703"
  version {
  instance_template = google_compute_instance_template.foobar.self_link
  name = "primary"
  }

  target_pools = [google_compute_target_pool.foobar.self_link]
  base_instance_name = "terraform"
  }

  data "google_compute_image" "centos_7" {
  family = "centos-7"
  project = "centos-cloud"
  }

  module "lb" {
  source = "GoogleCloudPlatform/lb/google"
  version = "2.2.0"
  region = "us-central1"
  name = "load-balancer"
  service_port = 80
  target_tags = ["my-target-pool"]
  network = "terraform-network"
  }