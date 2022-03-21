variable "name" {
    default = "terraform-network"
    type = string
    description = "name of the network"
}

variable "auto_create_subnetworks" {
    default = "true"
    type = bool
    description = "boolean value to create subnetworks"
}

variable "firewall-name" {
    default = "terraform-firewall"
    type = string
    description = "name of firewall"
}