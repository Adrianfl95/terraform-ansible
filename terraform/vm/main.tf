# vm/main.tf

variable "vm_name" {
  description = "Nombre de la máquina virtual"
  type        = string
}

variable "vm_machine_type" {
  description = "Tipo de máquina virtual"
  type        = string
  default     = "e2-micro"
}

variable "vm_zone" {
  description = "Zona de la máquina virtual"
  type        = string
  default     = "us-central1-a"
}

variable "vpc_network_name" {
  description = "Nombre de la VPC"
  type        = string
}

resource "google_compute_instance" "vm_instance" {
  name         = var.vm_name
  machine_type = var.vm_machine_type
  zone         = var.vm_zone

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  network_interface {
    network       = var.vpc_network_name
    access_config {
      nat_ip = google_compute_address.static_ip.address
    }
  }
}

resource "google_compute_address" "static_ip" {
  name = "${var.vm_name}-static-ip"
}
