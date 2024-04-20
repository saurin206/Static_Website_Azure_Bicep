param storageAccountName string
param cdnProfileName string
param cdnEndpointName string
param locationname string

resource rg 'Microsoft.Resources/resourceGroups@2021-08-01' = {
  name: resourceGroupName
  location: locationname
}
resource storageAccount 'Microsoft.Storage/storageAccounts@2021-08-01' = {
  name: storageAccountName
  location: locationname
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  //other properties
}
//resource cdnProfile 'Microsoft.Cdn/profiles@2021-06-01'

resource cdnProfile 'Microsoft.Cdn/profiles@2021-06-01' = {
  name: cdnProfileName
  location: locationname
  sku: {
    name: 'Standard_Microsoft'
  }
  //other properties
}

resource cdnEndpoint 'Microsoft.Cdn/profiles/endpoints@2021-06-01' = {
  name: cdnEndpointName
  parent: cdnProfile
  location: locationname  
  //other properties
}
