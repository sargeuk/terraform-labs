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

variable "vn-core" {
    description = "Virtual Network 01 - Core"
    default     =   "Core"
}
variable "coresn01" {
    type = "map"
    default = {
        name    = "training"
        subnet  = "10.0.1.0/24"
    }
}

variable "coresn02" {
    type = "map"
    default = {
        name    = "dev"
        subnet  = "10.0.2.0/24"
    }
}

variable "coresn03" {
    type = "map"
    default = {
        name    = "GatewaySubnet"
        subnet  = "10.0.0.0/24"
    }
}

variable "vngw-core" {
    type = "map"
    default = {
        vngwname    = "CORE-VNGW"
        pipname  = "vpnGatewayPublicIP"
    }
}