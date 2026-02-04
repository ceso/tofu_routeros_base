locals {
  # ------------------------------------------
  # Basic configs
  # ------------------------------------------
  rendered_login_message = templatefile("${path.module}/templates/login_message_note.tfpl", {
    login_note_ascii_art = var.login_note_ascii_art
    hostname             = var.hostname
    role                 = var.device_mode
    ip                   = var.device_mgmt_ip
    routerboard          = data.routeros_system_routerboard.routerboard_data.routerboard
    model                = data.routeros_system_routerboard.routerboard_data.model
    time_zone            = var.time_zone
  })

  # ------------------------------------------
  # NTP
  # ------------------------------------------
  ntp_fw_addr_list = {
    for item in flatten([
      for host, a_rec in data.dns_a_record_set.dns_get_record_a : [
        for ip in a_rec.addrs : {
          address = ip
          comment = "${host}|DAL4"
          list    = "FC_A_NTP"
        }
      ]
    ]) :
    item.address => item
  }
}