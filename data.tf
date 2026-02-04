
# ------------------------------------------
# Basic configs
# ------------------------------------------
data "routeros_system_routerboard" "routerboard_data" {}

# ------------------------------------------
# NTP
# ------------------------------------------
data "dns_a_record_set" "dns_get_record_a" {
  for_each = toset(var.ntp_servers)

  host = each.value
}