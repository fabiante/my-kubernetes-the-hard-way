resource "gridscale_network" "internal"{
  name = "internal"
  dhcp_active = true
  dhcp_gateway = "192.168.121.1"
  dhcp_dns = "192.168.121.2"
  dhcp_range = "192.168.121.0/27"
  dhcp_reserved_subnet = ["192.168.121.0/31"]
  timeouts {
      create="10m"
  }
}

resource "gridscale_firewall" "firewall" {
  name   = "firewall"
  rules_v4_in {
    order = 0
    protocol = "tcp"
    action = "accept"
    src_cidr = var.trusted_src_ip
  }
  rules_v4_in {
    order = 0
    protocol = "udp"
    action = "accept"
    src_cidr = var.trusted_src_ip
  }
  timeouts {
    create="10m"
  }
}

data "gridscale_public_network" "internet" {
}
