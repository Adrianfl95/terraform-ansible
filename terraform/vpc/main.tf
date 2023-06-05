# vpc/main.tf

variable "vpc_name" {
  description = "Nombre de la VPC"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR de la VPC"
  type        = string
  default     = "10.0.0.0/16"
}

resource "google_compute_network" "vpc_network" {
  name                    = var.vpc_name
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "vpc_subnetwork" {
  name          = "${var.vpc_name}-subnetwork"
  ip_cidr_range = var.vpc_cidr
  network       = google_compute_network.vpc_network.name
}

output "vpc_network_name" {
  value = google_compute_network.vpc_network.name
}

output "vpc_subnetwork_name" {
  value = google_compute_subnetwork.vpc_subnetwork.name
}
