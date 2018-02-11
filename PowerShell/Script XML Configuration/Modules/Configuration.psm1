<# 

  Mosh Jahán
  Global Operations | Smart Centre

  This module loads data from configuration files in ./config folder

#>

Function Get-DatastoreForPurpose
{
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
  Param
  (
    $configurationFilePath
  ) 

  Write-Host "Loading configuration from $configurationFilePath"

  [xml]$xmlDocument = Get-Content -Path $configurationFilePath

  Return $xmlDocument
} 

Function Get-Config
{
  Param
  (
    [string]$configurationFilePath
  ) 

  return Get-ScriptConfiguration -configurationFilePath $configurationFilePath
}

# End of file