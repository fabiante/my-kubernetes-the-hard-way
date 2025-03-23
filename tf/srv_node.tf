resource "gridscale_server" "node" {
  count = var.node_count
  name  = "node-${count.index}"
  cores = 1
  memory = 2

  power = var.power

  storage {
    object_uuid = gridscale_storage.node[count.index].id
  }

  network {
    object_uuid = gridscale_network.internal.id
  }

  network {
    object_uuid = data.gridscale_public_network.internet.id
    firewall_template_uuid = gridscale_firewall.firewall.id
  }


  ipv4 = gridscale_ipv4.node[count.index].id

  timeouts {
    create = "10m"
  }
}

resource "gridscale_ipv4" "node" {
  count = var.node_count
  name  = "node-${count.index}"
  timeouts {
    create = "10m"
  }
}

output "node_wan_ip" {
  value = gridscale_ipv4.node[*].ip
}

resource "gridscale_storage" "node" {
  count = var.node_count
  name  = "node-${count.index}"
  capacity = 20
  storage_type = "storage_high"

  template {
    template_uuid = var.gs_storage_template_id
    sshkeys = [gridscale_sshkey.ssh.id]
    hostname = "node-${count.index}"
  }

  timeouts {
    create = "10m"
  }
}
