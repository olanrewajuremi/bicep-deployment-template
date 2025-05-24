param storageName string
param azureRegion string
param storageSku string
param environment string = 'dev' 

resource bicepstorage 'Microsoft.Storage/storageAccounts@2024-01-01' = {
  name: '${storageName}${environment}'
  location: azureRegion
  sku: {
    name: storageSku
  }
  kind: 'StorageV2'
}
