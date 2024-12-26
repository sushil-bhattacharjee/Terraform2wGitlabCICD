resource "iosxe_interface_ospf" "loopback_ospf" {
  for_each = var.loopbacks

  type                             = "Loopback"
  name                             = each.value.name
  cost                             = 10
  dead_interval                    = 30
  hello_interval                   = 5
  mtu_ignore                       = false
  network_type_broadcast           = false
  network_type_non_broadcast       = false
  network_type_point_to_multipoint = false
  network_type_point_to_point      = true
  priority                         = 10
  ttl_security_hops                = 2

  process_ids = [
    {
      id = 1
      areas = [
        {
          area_id = 0
        }
      ]
    }
  ]

  depends_on = [iosxe_interface_loopback.loopback_interfaces]
}
