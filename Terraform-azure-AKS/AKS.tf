resource "azurerm_resource_group" "aks-gr" {
  name     = "aks-resources"
  location = "West Europe"
}

resource "azurerm_kubernetes_cluster" "aks-cluster" {
  name                = "cluster-aks1"
  location            = azurerm_resource_group.aks-gr.location
  resource_group_name = azurerm_resource_group.aks-gr.name
  dns_prefix          = "pojet-aks1"

  default_node_pool {
    name       = "default"
    node_count = 2
    vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Production"
  }
}

