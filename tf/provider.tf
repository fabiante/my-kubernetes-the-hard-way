# Declare required provider
terraform {
  required_providers {
    gridscale = {
      source = "gridscale/gridscale"
    }
  }
}

provider "gridscale" {
  uuid = var.gs_uuid
  token = var.gs_token
}
