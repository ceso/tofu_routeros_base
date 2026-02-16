<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_dns"></a> [dns](#requirement\_dns) | 3.4.3 |
| <a name="requirement_routeros"></a> [routeros](#requirement\_routeros) | 1.99.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_dns"></a> [dns](#provider\_dns) | 3.4.3 |
| <a name="provider_routeros"></a> [routeros](#provider\_routeros) | 1.99.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [routeros_ip_firewall_addr_list.ntp_fw_addr_list](https://registry.terraform.io/providers/terraform-routeros/routeros/1.99.0/docs/resources/ip_firewall_addr_list) | resource |
| [routeros_system_clock.timezone](https://registry.terraform.io/providers/terraform-routeros/routeros/1.99.0/docs/resources/system_clock) | resource |
| [routeros_system_identity.hostname](https://registry.terraform.io/providers/terraform-routeros/routeros/1.99.0/docs/resources/system_identity) | resource |
| [routeros_system_note.login_msg_note](https://registry.terraform.io/providers/terraform-routeros/routeros/1.99.0/docs/resources/system_note) | resource |
| [routeros_system_ntp_client.ntp_client_servers](https://registry.terraform.io/providers/terraform-routeros/routeros/1.99.0/docs/resources/system_ntp_client) | resource |
| [routeros_system_ntp_server.ntp_server_settings](https://registry.terraform.io/providers/terraform-routeros/routeros/1.99.0/docs/resources/system_ntp_server) | resource |
| [dns_a_record_set.dns_get_record_a](https://registry.terraform.io/providers/hashicorp/dns/3.4.3/docs/data-sources/a_record_set) | data source |
| [routeros_system_routerboard.routerboard_data](https://registry.terraform.io/providers/terraform-routeros/routeros/1.99.0/docs/data-sources/system_routerboard) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_configure_hostname"></a> [configure\_hostname](#input\_configure\_hostname) | Whether to configure device Hostname or not | `bool` | `false` | no |
| <a name="input_configure_login_message_note"></a> [configure\_login\_message\_note](#input\_configure\_login\_message\_note) | Whether to configure the login message note or not | `bool` | `false` | no |
| <a name="input_configure_ntp"></a> [configure\_ntp](#input\_configure\_ntp) | Whether to configure the NTP client or not | `bool` | `false` | no |
| <a name="input_device_mgmt_ip"></a> [device\_mgmt\_ip](#input\_device\_mgmt\_ip) | The MGMT IP the device has | `string` | `"192.168.88.1"` | no |
| <a name="input_device_mode"></a> [device\_mode](#input\_device\_mode) | Mode in which the device is being configured | `string` | `"Router"` | no |
| <a name="input_hostname"></a> [hostname](#input\_hostname) | Hostname of the device being configured | `string` | `"example.local"` | no |
| <a name="input_login_msg_show_at_login"></a> [login\_msg\_show\_at\_login](#input\_login\_msg\_show\_at\_login) | Whether to show the login note message at login or not | `bool` | `false` | no |
| <a name="input_login_note_ascii_art"></a> [login\_note\_ascii\_art](#input\_login\_note\_ascii\_art) | ASCII Art to be added as part of login message note | `string` | `null` | no |
| <a name="input_ntp_firewall_address_list_name"></a> [ntp\_firewall\_address\_list\_name](#input\_ntp\_firewall\_address\_list\_name) | The name of the Firewall address list for trusted NTP servers | `string` | `"FC_A_NTP"` | no |
| <a name="input_ntp_servers"></a> [ntp\_servers](#input\_ntp\_servers) | A list containing the DNS Names of the NTP servers to be set | `list(string)` | <pre>[<br/>  "time.cloudflare.com",<br/>  "nts.netnod.se",<br/>  "ptbtime1.ptb.de",<br/>  "ntppool1.time.nl"<br/>]</pre> | no |
| <a name="input_ntp_servers_settings"></a> [ntp\_servers\_settings](#input\_ntp\_servers\_settings) | The NTP Server settings that will be used.<br/>For reference:<br/>  * https://help.mikrotik.com/docs/spaces/ROS/pages/40992869/NTP#NTP-NTPServersettings | <pre>object({<br/>    enabled             = bool<br/>    broadcast           = bool<br/>    multicast           = bool<br/>    manycast            = bool<br/>    use_local_clock     = bool<br/>    local_clock_stratum = number<br/>  })</pre> | <pre>{<br/>  "broadcast": true,<br/>  "enabled": true,<br/>  "local_clock_stratum": 3,<br/>  "manycast": true,<br/>  "multicast": true,<br/>  "use_local_clock": true<br/>}</pre> | no |
| <a name="input_show_at_cli_login"></a> [show\_at\_cli\_login](#input\_show\_at\_cli\_login) | Whether to show the login note message at cli login or not | `bool` | `false` | no |
| <a name="input_time_zone"></a> [time\_zone](#input\_time\_zone) | RouterOS time zone name (IANA tz database format, e.g. Europe/Berlin). Empty means enables autodetect. | `string` | `"Europe/Berlin"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ntp_client_status"></a> [ntp\_client\_status](#output\_ntp\_client\_status) | Current status of the NTP client |
| <a name="output_ntp_fw_addr_list_ids"></a> [ntp\_fw\_addr\_list\_ids](#output\_ntp\_fw\_addr\_list\_ids) | ID of the generated Firewall NTP Address Lists |
<!-- END_TF_DOCS -->
