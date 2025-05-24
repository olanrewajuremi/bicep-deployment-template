param azureRegion string = resourceGroup().location

resource appServicePlan 'Microsoft.Web/serverfarms@2020-12-01' = {
  name: 'aspDemo7'
  location: azureRegion
  sku: {
    name: 'F1'
    capacity: 1
    tier: 'Free'
  }
}

resource webApplication 'Microsoft.Web/sites@2021-01-15' = {
  name: 'myDemoApp7'
  location: azureRegion
  tags: {
    'hidden-related:${resourceGroup().id}/providers/Microsoft.Web/serverfarms/appServicePlan': 'Resource'
  }
  properties: {
    serverFarmId: appServicePlan.id
    httpsOnly:true
  }
}

output webApplicationHostName string = webApplication.properties.defaultHostName


  

