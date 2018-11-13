variable "loc" {
    description = "Default Azure region"
    default     =   "West Europe"
}

variable "tags" {
    default     = {
        source  = "citadel"
        env     = "training"
    }
}

variable "VN01" {
    description = "Virtual Network 01 - Core"
    default     =   "Core"
}
variable "VN01-SN01" {
    type = "map"
    default = {
        name    = "training"
        subnet  = "10.0.1.0/24"
    }
}

variable "VN01-SN02" {
    type = "map"
    default = {
        name    = "dev"
        subnet  = "10.0.2.0/24"
    }
}

variable "VN01-SN03" {
    type = "map"
    default = {
        name    = "Gateway Subnet"
        subnet  = "10.0.0.0/24"
    }
}

variable "PIP01" {
    description = "Public IP 01 - VNGW"
    default     =   "vpnGatewayPublicIP"
}
