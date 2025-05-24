
resource bicepstorage 'Microsoft.Storage/storageAccounts@2024-01-01' = {
  name: 'bicepstoragedemo1'
  location: 'eastus'
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
}
