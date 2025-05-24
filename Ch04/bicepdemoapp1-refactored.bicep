param sites_bicepdemo_app_name string = 'bicepdemo-app1'
param storageAccounts_name string = 'bicepstg${uniqueString(subscription().id)}' // Unique name
param registries_demoacr109_name string = 'demoacr1090'
param azureRegion string = 'eastus'

// Azure Container Registry
resource registries_demoacr109_name_resource 'Microsoft.ContainerRegistry/registries@2021-06-01-preview' = {
  name: registries_demoacr109_name
  location: azureRegion
  sku: {
    name: 'Basic'
  }
  properties: {
    adminUserEnabled: true
  }
}

// Storage Account
resource storageAccounts_name_resource 'Microsoft.Storage/storageAccounts@2021-04-01' = {
  name: storageAccounts_name
  location: azureRegion
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
}

// Web App
resource sites_bicepdemo_app_name_resource 'Microsoft.Web/sites@2021-01-15' = {
  name: sites_bicepdemo_app_name
  location: azureRegion
  kind: 'app'
  properties: {
   enabled: true
    siteConfig: {
      alwaysOn: false  // Set this to false or remove it
    }


  }
}

// Hostname Binding (Fixed Format)
resource sites_bicepdemo_app_name_hostNameBinding 'Microsoft.Web/sites/hostNameBindings@2021-01-15' = {
  parent: sites_bicepdemo_app_name_resource
  name: '${sites_bicepdemo_app_name}.azurewebsites.net'
  properties: {
    siteName: sites_bicepdemo_app_name
    hostNameType: 'Verified'
  }
}
