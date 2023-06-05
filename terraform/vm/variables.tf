# vm/variables.tf

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
