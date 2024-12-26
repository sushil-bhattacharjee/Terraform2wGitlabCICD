resource "iosxe_interface_loopback" "loopback_interfaces" {
  for_each = var.loopbacks

  description       = "Managed by Terraform (${each.key})"
  ipv4_address_mask = "255.255.255.255"
  name              = each.value.name
  ipv4_address      = each.value.ipv4_address
}