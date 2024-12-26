terraform {
  backend "http" {

  }
  required_providers {
    iosxe = {
      source  = "ciscodevnet/iosxe"
      version = "0.5.6"
    }
  }
}

# Configure the provider
provider "iosxe" {
  username = var.username
  password = var.password
  url      = var.url
}

# Configure the data block to collect the remote resource
data "iosxe_interface_loopback" "Loopback100" {
  name = 100
}

# Declare an output value for the remote resource 
output "loopback_address" {
  value = data.iosxe_interface_loopback.Loopback100.ipv4_address
}

# Define the import block
# import {
#     id = "Cisco-IOS-XE-native:native/interface/Loopback=100"
#     to = iosxe_interface_loopback.management_loopback
# }

# Define the resource block for imported configuration
resource "iosxe_interface_loopback" "management_loopback" {
  description                     = "Managed by Terraform"
  ip_access_group_in_enable       = false
  ip_access_group_out_enable      = false
  ip_proxy_arp                    = false
  ip_redirects                    = false
  ip_unreachables                 = false
  ipv4_address                    = "20.20.20.5"
  ipv4_address_mask               = "255.255.255.255"
  ipv6_address_autoconfig_default = false
  ipv6_address_dhcp               = false
  ipv6_enable                     = false
  ipv6_nd_ra_suppress_all         = false
  name                            = 20
  shutdown                        = false
}