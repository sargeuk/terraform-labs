resource "azurerm_resource_group" "core" {
   name = "core"
   location = "${var.loc}"
   tags = "${var.tags}"
}

resource "azurerm_public_ip" "PIP01" {
  name = "${var.vngw-core["pipname"]}"
    location = "${azurerm_resource_group.core.location}"
    resource_group_name = "${azurerm_resource_group.core.name}"
    public_ip_address_allocation = "Dynamic"
    idle_timeout_in_minutes      = 30

}

resource "azurerm_virtual_network" "core" {
  name                = "${var.vn-core}"
  resource_group_name = "${azurerm_resource_group.core.name}"
  address_space       = ["10.0.0.0/16"]
  location            = "${azurerm_resource_group.core.location}"
  dns_servers         = ["1.1.1.1", "1.0.0.1"]

}

resource "azurerm_subnet" "core-sn01" {
  name                 = "${var.coresn01["name"]}"
  resource_group_name  = "${azurerm_resource_group.core.name}"
  virtual_network_name = "${azurerm_virtual_network.core.name}"
  address_prefix       = "${var.coresn01["subnet"]}"

}

resource "azurerm_subnet" "core-sn02" {
  name                 = "${var.coresn02["name"]}"
  resource_group_name  = "${azurerm_resource_group.core.name}"
  virtual_network_name = "${azurerm_virtual_network.core.name}"
  address_prefix       = "${var.coresn02["subnet"]}"

}

resource "azurerm_subnet" "core-sn03" {
  name                 = "${var.coresn03["name"]}"
  resource_group_name  = "${azurerm_resource_group.core.name}"
  virtual_network_name = "${azurerm_virtual_network.core.name}"
  address_prefix       = "${var.coresn03["subnet"]}"

}



#resource "azurerm_virtual_network_gateway" "VNGW" {
#  name = "${var.vngw-core["vngwname"]}"
#  location = "${azurerm_resource_group.core.location}"
#  resource_group_name = "${azurerm_resource_group.core.name}"
#  tags = "${azurerm_resource_group.core.tags}"

#  type = "Vpn"
#  vpn_type = "RouteBased"

#  enable_bgp = true
#  sku = "Basic"

#  ip_configuration {
#    name = "vnetGatewayConfig"
#    public_ip_address_id = "${azurerm_public_ip.PIP01.id}"
#    private_ip_address_allocation = "Dynamic"
#    subnet_id = "${azurerm_subnet.core-sn03.id}"
#  }
#}