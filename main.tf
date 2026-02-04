# ------------------------------------------
# Basic configs
# ------------------------------------------
resource "routeros_system_identity" "hostname" {
  count = var.configure_hostname ? 1 : 0

  name = var.hostname
}
resource "routeros_system_clock" "timezone" {
  time_zone_name       = var.time_zone != null ? var.time_zone : null
  time_zone_autodetect = var.time_zone == null ? true : false
}
resource "routeros_system_note" "login_msg_note" {
  count = var.configure_login_message_note ? 1 : 0

  note              = local.rendered_login_message
  show_at_login     = var.login_msg_show_at_login
  show_at_cli_login = var.show_at_cli_login
}

# ------------------------------------------
# NTP
# ------------------------------------------
resource "routeros_ip_firewall_addr_list" "ntp_fw_addr_list" {
  for_each = var.configure_ntp ? local.ntp_fw_addr_list : {}

  address = each.value.address
  comment = each.value.comment
  list    = each.value.list
}
resource "routeros_system_ntp_client" "ntp_client_servers" {
  for_each = var.configure_ntp ? toset(var.ntp_servers) : []

  enabled = true
  servers = var.ntp_servers
}
resource "routeros_system_ntp_server" "ntp_server_settings" {
  count = var.configure_ntp ? 1 : 0

  enabled             = var.ntp_servers_settings.enabled
  broadcast           = var.ntp_servers_settings.broadcast
  multicast           = var.ntp_servers_settings.multicast
  manycast            = var.ntp_servers_settings.manycast
  use_local_clock     = var.ntp_servers_settings.use_local_clock
  local_clock_stratum = var.ntp_servers_settings.local_clock_stratum
}