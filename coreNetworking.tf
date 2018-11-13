resource "azurerm_resource_group" "core" {
   name = "core"
   location = "${var.loc}"
   tags = "${var.tags}"
}

resource "azurerm_public_ip" "PIP01" {
    name = "${var.PIP01}"
    location = "${azurerm_resource_group.core.location}"
    resource_group_name = "${azurerm_resource_group.core.name}"
    public_ip_address_allocation = "Dynamic"
    idle_timeout_in_minutes      = 30
    Tags = "${azurerm_resource_group.core.tags}"
}

resource "azurerm_virtual_network" "VN01" {
  name                = "${var.VN01}"
  resource_group_name = "${azurerm_resource_group.core.name}"
  address_space       = ["10.0.0.0/16"]
  location            = "${azurerm_resource_group.core.location}"
  dns_servers         = ["1.1.1.1", "1.0.0.1"]

  subnet {
    name           = "${var.VN01-SN01[name]}"
    address_prefix = "${var.VN01-SN01[subnet]}"
  }

  subnet {
    name           = "${var.VN01-SN02[name]}"
    address_prefix = "${var.VN01-SN02[subnet]}"
  }

  gateway subnet {
    address_prefix = "${var.VN01-SN03[subnet]}"
  }

    Tags = "${azurerm_resource_group.core.tags}"
}