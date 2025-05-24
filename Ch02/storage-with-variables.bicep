// storage-with-variables.bicep

param storageName string
param azureRegion string
param environment string = 'dev' 
var accountName = '${storageName}${environment}'
var storageAccountSkuName = (environment == 'prod') ? 'Standard_GRS' : 'Standard_LRS'

resource bicepstorage 'Microsoft.Storage/storageAccounts@2024-01-01' = {
  name: accountName
  location: azureRegion
  sku: {
    name: storageAccountSkuName
  }
  kind: 'StorageV2'
}

output storageId string = bicepstorage.id
output blobEndpoint string = bicepstorage.properties.primaryEndpoints.blob


