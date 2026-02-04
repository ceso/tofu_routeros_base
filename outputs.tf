# ------------------------------------------
# NTP
# ------------------------------------------
output "ntp_fw_addr_list_ids" {
  description = "ID of the generated Firewall NTP Address Lists"
  value       = try(routeros_ip_firewall_addr_list.ntp_fw_addr_list[*], null)
}
output "ntp_client_status" {
  description = "Current status of the NTP client"
  value       = try(routeros_system_ntp_client.ntp_client_servers[*].status, null)
}