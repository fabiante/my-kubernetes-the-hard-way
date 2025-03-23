resource "gridscale_server" "jumpbox" {
  name = "jumpbox"
  cores = 1
  memory = 1

  power = var.power

  storage {
    object_uuid = gridscale_storage.jumpbox.id
  }

  network {
    object_uuid = gridscale_network.internal.id
  }

  network {
    object_uuid = data.gridscale_public_network.internet.id
    firewall_template_uuid = gridscale_firewall.firewall.id
  }

  ipv4 = gridscale_ipv4.jumpbox.id

  timeouts {
      create="10m"
  }
}

resource "gridscale_ipv4" "jumpbox" {
  name = "jumpbox"
  timeouts {
      create="10m"
  }
}

output "jumpbox_wan_ip" {
  value = gridscale_ipv4.jumpbox.ip
}

resource "gridscale_storage" "jumpbox" {
  name = "jumpbox"
  capacity = 10
  storage_type = "storage_high"

  template {
    template_uuid = var.gs_storage_template_id
    sshkeys = [gridscale_sshkey.ssh.id]
    hostname = "jumpbox"
  }

  timeouts {
    create="10m"
  }
}
