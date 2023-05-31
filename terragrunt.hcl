# terragrunt.hcl
remote_state {
  backend = "gcs"
  config = {
    bucket = "<NOMBRE_DEL_BUCKET>"
    prefix = "<PREFIJO_DEL_ESTADO>"
  }
}

terraform {
  extra_arguments "google" {
    commands = ["init"]
  }
}

include {
  path = "${find_in_parent_folders()}"
}
