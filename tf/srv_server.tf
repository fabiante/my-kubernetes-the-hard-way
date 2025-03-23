resource "gridscale_server" "server" {
  name = "server"
  cores = 1
  memory = 2

  power = var.power

  storage {
    object_uuid = gridscale_storage.server.id
  }

  network {
    object_uuid = gridscale_network.internal.id
  }

  network {
    object_uuid = data.gridscale_public_network.internet.id
    firewall_template_uuid = gridscale_firewall.firewall.id
  }


  ipv4 = gridscale_ipv4.server.id

  timeouts {
      create="10m"
  }
}

resource "gridscale_ipv4" "server" {
  name = "server"
  timeouts {
      create="10m"
  }
}

output "server_wan_ip" {
  value = gridscale_ipv4.server.ip
}

resource "gridscale_storage" "server" {
  name = "server"
  capacity = 20
  storage_type = "storage_high"

  template {
    template_uuid = var.gs_storage_template_id
    sshkeys = [gridscale_sshkey.ssh.id]
    hostname = "server"
  }

  timeouts {
    create="10m"
  }
}
