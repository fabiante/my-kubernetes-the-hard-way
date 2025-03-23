resource "gridscale_sshkey" "ssh" {
  name = "ssh"
  sshkey = var.ssh_key
}