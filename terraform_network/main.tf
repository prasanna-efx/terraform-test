resource "google_compute_network" "vpc_network" {
  name                    = var.name
  auto_create_subnetworks = var.auto_create_subnetworks
}

resource "google_compute_firewall" "firewallrule" {
  name    = var.firewall-name
  network = var.name

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["80", "443"]
  }

  direction = "EGRESS"
  destination_ranges = ["0.0.0.0/0"]

}