// container-registry.bicep

targetScope = 'resourceGroup'

resource containerRegistry 'Microsoft.ContainerRegistry/registries@2021-06-01-preview' = {
  name: 'acr1097freename'
  location: resourceGroup().location
  sku: {
    name: 'Basic'
  }
  properties: {
    adminUserEnabled: true
  }
}

output containerRegistryLoginServer string = containerRegistry.properties.loginServer
