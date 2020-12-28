# Create the internal vpc
resource "google_compute_network" "vpc_network" {
  name                    = "gcp-octopodami-network"
  auto_create_subnetworks = "true"
}

# Create the instance.
resource "google_compute_instance" "gcp-octopodami-vm" {
  name         = var.name
  machine_type = var.vm_type
  project      = var.project
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = var.imagedisk
    }
  }

  network_interface {
    # Link the network interface to the vpc
    network = google_compute_network.vpc_network.self_link
    access_config {
    }
  }
}