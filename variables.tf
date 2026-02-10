# ------------------------------------------
# Control Flow
# ------------------------------------------
variable "configure_hostname" {
  description = "Whether to configure device Hostname or not"
  type        = bool
  default     = false
}
variable "configure_login_message_note" {
  description = "Whether to configure the login message note or not"
  type        = bool
  default     = false
}
variable "login_msg_show_at_login" {
  description = "Whether to show the login note message at login or not"
  type        = bool
  default     = false
}
variable "show_at_cli_login" {
  description = "Whether to show the login note message at cli login or not"
  type        = bool
  default     = false
}
variable "configure_ntp" {
  description = "Whether to configure the NTP client or not"
  type        = bool
  default     = false
}

# ------------------------------------------
# Basic configs
# ------------------------------------------
variable "device_mgmt_ip" {
  description = "The MGMT IP the device has"
  type        = string
  default     = "192.168.88.1"
}
variable "hostname" {
  description = "Hostname of the device being configured"
  type        = string
  default     = "example.local"
}
variable "login_note_ascii_art" {
  description = "ASCII Art to be added as part of login message note"
  type        = string
  default     = null
}
variable "time_zone" {
  description = "RouterOS time zone name (IANA tz database format, e.g. Europe/Berlin). Empty means enables autodetect."
  type        = string
  default     = "Europe/Berlin"

  validation {
    condition = var.time_zone == null || can(regex(
      "^(Africa|America|Antarctica|Asia|Atlantic|Australia|Europe|Indian|Pacific|Etc)\\/[A-Za-z0-9_+-]+$",
      var.time_zone
    ))
    error_message = "'time_zone' must be null or a valid IANA timezone name (e.g. Europe/Berlin)."
  }
}
variable "device_mode" {
  description = "Mode in which the device is being configured"
  type        = string
  default     = "Router"

  validation {
    condition = contains([
      "Router",
      "Switch"
    ], var.device_mode)
    error_message = "'device_mode' must be one of Router or Switch"
  }
}

# ------------------------------------------
# NTP
# ------------------------------------------
variable "ntp_servers" {
  description = "A list containing the DNS Names of the NTP servers to be set"
  type        = list(string)
  default     = ["time.cloudflare.com", "nts.netnod.se", "ptbtime1.ptb.de", "ntppool1.time.nl"]
}
variable "ntp_firewall_address_list_name" {
  description = "The name of the Firewall address list for trusted NTP servers"
  type        = string
  default     = "FC_A_NTP"
}
variable "ntp_servers_settings" {
  description = <<-EOT
  The NTP Server settings that will be used.
  For reference:
    * https://help.mikrotik.com/docs/spaces/ROS/pages/40992869/NTP#NTP-NTPServersettings
  EOT
  type = object({
    enabled             = bool
    broadcast           = bool
    multicast           = bool
    manycast            = bool
    use_local_clock     = bool
    local_clock_stratum = number
  })
  default = {
    enabled             = true
    broadcast           = true
    multicast           = true
    manycast            = true
    use_local_clock     = true
    local_clock_stratum = 3
  }
}