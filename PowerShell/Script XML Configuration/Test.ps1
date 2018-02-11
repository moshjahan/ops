Import-Module $PSScriptRoot\Modules\Configuration -Verbose

$CONFIGURATION_FILE = "$PSScriptRoot\Config\Script.config.xml"

# Main

$config = Get-ScriptConfiguration `
  -configurationFilePath $CONFIGURATION_FILE

$datastore = Get-DatastoreForPurpose `
  -purpose 'Development' `
  -xmlConfiguration $config

$template = Get-TemplateForPlatformType `
  -platformType 'Windows Server' `
  -xmlConfiguration $config

Write-Host "Datastore for Development is" $datastore
Write-Host "Template for Windows Server is" $template
