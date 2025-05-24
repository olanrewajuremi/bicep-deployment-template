// deploy-module.bicep

module appService '../Ch01/web-app-sample.bicep' = {
  name: 'myNewBicepDeployment'
  params: {
    azureRegion: resourceGroup().location
  }
}

output appServiceHostName string = appService.outputs.webApplicationHostName
