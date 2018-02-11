<# 

  Mosh Jahán
  Global Operations | Smart Centre

  This module loads data from configuration files in ./config folder

#>

Function Get-DatastoreForPurpose
{
  <#
  .SYNOPSIS
  Return the datastore for a given purpose
  
  .DESCRIPTION
  This function takes a purpose parameter and returns the corresponding datastore name
  
  .PARAMETER purpose
  The purpose string from the ServiceNow catalog item
  
  .PARAMETER xmlConfiguration
  The XML configuration for this script
  
  .EXAMPLE
  $store = Get-DatastoreForPurpose -purpose 'Development' -xmlConfiguration $config 
  #>

  [CmdletBinding()]
  Param
  (
    [string]$purpose, 
    [xml]$xmlConfiguration
  ) 

  $datastores = $xmlConfiguration.Configuration.Datastores.Datastore

  Foreach($datastore in $datastores)
  {
    If ($datastore.Purpose -eq $purpose)
    {
      Return $datastore.innerText
    }
  }    
}

Function Get-TemplateForPlatformType
{
  <#
  .SYNOPSIS
  Return the template name for a given platform type
  
  .DESCRIPTION
  This function takes a platform type parameter and returns the corresponding build template name
  
  .PARAMETER platformType
  The platform type string from the ServiceNow catalog item
  
  .PARAMETER xmlConfiguration
  The XML configuration for this script
  
  .EXAMPLE
  $store = Get-DatastoreForPlatformType -platformType 'Windows Server' -xmlConfiguration $config
  #>

  Param
  (
    [string]$platformType, 
    [xml]$xmlConfiguration
  ) 

  $templates = $xmlConfiguration.Configuration.Templates.Template

  Foreach($template in $templates)
  {
    If ($template.PlatformType -eq $platformType)
    {
      Return $template.innerText
    }
  }    
}

Function Get-ScriptConfiguration
{
  <#
  .SYNOPSIS
  Loads configuration data from a config file
  
  .DESCRIPTION
  This function takes a path to an XML file and returns an XML document object with the contents of the file
  
  .PARAMETER configurationFilePath
  The XML file to read as configuration data
  
  .EXAMPLE
  $config = Get-ScriptConfiguration -configurationFilePath "$PSScriptRoot\Config\Script.config.xml"
  #>

  Param
  (
    $configurationFilePath
  ) 

  Write-Host "Loading configuration from $configurationFilePath"

  [xml]$xmlDocument = Get-Content -Path $configurationFilePath

  Return $xmlDocument
} 

# End of file