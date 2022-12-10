#$tenantid = "02feabb9-444e-4f66-9c13-6a8f04b75c2f"
#$subscriptionid = "efc1e7b1-5729-4eea-b33e-12cc6b1c0183"
#$credentials = Get-Credential
#$userID = "34c49619-211d-4383-bc27-7ec888f28c8f"
#$secret = "pa08Q~n4Ps2h5blo8Y6UxMJ~vl.SROCiCCbjsc8s"
#Connect-AzAccount -ServicePrincipal -Credential $credentials -TenantId $tenantid -Environment AzureCloud -Subscription $subscriptionid

$rg = "Modul-09-Oving"
$location = "North Europe"
New-AzResourceGroup -Name $rg -Location $location -Force

$storageAccount = New-AzStorageAccount -ResourceGroupName $rg `
    -Name "samdhm9" `
    -SkuName Standard_LRS `
    -Location $location

$ctx = $storageAccount.Context

$containerName = "blobmdhm9"
New-AzStorageContainer -Name $containerName -Context $ctx -Permission blob

Set-AzStorageBlobContent -File ".\Modul 9 - ARM Templates Del 7\InfrastrukturLinked.json" -Container $containerName `
    -Blob "InfrastrukturLinked.json" `
    -Context $ctx `
    -StandardBlobTier Hot
#MERK: Blog er det samme som filnavnet

#Remove-AzResourceGroup -name $rg -Force:$true
