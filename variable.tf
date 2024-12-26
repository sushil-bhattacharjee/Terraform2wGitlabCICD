variable "username" {
  description = "device management user"
  type        = string
  default     = "cisco"
}

variable "password" {
  description = "user password"
  type        = string
  default     = "cisco"
  sensitive   = true
}

variable "url" {
  description = "device url"
  type        = string
  default     = "localhost"
}

variable "loopbacks" {
  description = "Map of Loopback interfaces"
  type = map(object({
    name         = string
    ipv4_address = string
  }))
}

variable "gitlab_token" {
  description = "Gitlab token"
  type        = string
  default = "value"
  sensitive   = true
}
