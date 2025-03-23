variable "gs_uuid" {

}

variable "gs_token" {
  sensitive = true
}

variable "ssh_key" {
  sensitive = true
}

variable "gs_storage_template_id" {
  default = "4db64bfc-9fb2-4976-80b5-94ff43b1233a" # Debian 12
}

variable "power" {
  default = false
  type = bool
}

variable "node_count" {
  description = "Number of nodes to create"
}

variable "trusted_src_ip" {
  description = "Trusted source IP"
}
