# main.tf
provider "google" {
  credentials = file("<RUTA_AL_ARCHIVO_DE_CREDENCIALES>")
  project     = "<ID_DEL_PROYECTO>"
  region      = "us-central1"
}

resource "google_compute_network" "vpc_network" {
  name                    = "my-vpc-network"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "vpc_subnetwork" {
  name          = "my-vpc-subnetwork"
  ip_cidr_range = "10.0.0.0/24"
  network       = google_compute_network.vpc_network.name
}

resource "google_compute_address" "static_ip" {
  name = "my-static-ip"
}

resource "google_compute_instance" "vm_instance" {
  name         = "my-vm-instance"
  machine_type = "e2-micro"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  network_interface {
    subnetwork         = google_compute_subnetwork.vpc_subnetwork.self_link
    access_config {
      nat_ip = google_compute_address.static_ip.address
    }
  }
}
