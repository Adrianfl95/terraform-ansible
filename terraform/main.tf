# main.tf

terraform {
  required_version = ">= 1.0"
}

provider "google" {
  credentials = file("<RUTA_AL_ARCHIVO_DE_CREDENCIALES>")
  project     = "<ID_DEL_PROYECTO>"
  region      = "us-central1"
}

module "vpc" {
  source    = "./vpc"
  vpc_name  = "my-vpc"
  vpc_cidr  = "10.0.0.0/16"
}

module "vm" {
  source           = "./vm"
  vm_name          = "my-vm"
  vm_machine_type  = "e2-micro"
  vm_zone          = "us-central1-a"
  vpc_network_name = module.vpc.vpc_network_name
}
