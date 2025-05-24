resource appServicePlan 'Microsoft.Web/serverfarms@2020-12-01' = {
  name: 'aspDemo7'
  location: resourceGroup().location
  sku: {
    name: 'F1'
    capacity: 1
  }
}

resource webAppResource 'Microsoft.Web/sites@2021-01-15' = {
  name: 'myDemoApp7'
  location: resourceGroup().location
  tags: {
    'hidden-related:${resourceGroup().id}/providers/Microsoft.Web/serverfarms/appServicePlan': 'Resource'
  }
  properties: {
    serverFarmId: appServicePlan.id
  }
}

resource myNewStorage 'Microsoft.Storage/storageAccounts@2024-01-01' = {
  name: 'storagedemo123'
  location: resourceGroup().location
  sku: {
    name: 'Standard_GRS'
  }
  kind: 'StorageV2'
}
  

