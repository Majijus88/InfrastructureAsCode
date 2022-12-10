#$tenantid = "02feabb9-444e-4f66-9c13-6a8f04b75c2f"
#$subscriptionid = "efc1e7b1-5729-4eea-b33e-12cc6b1c0183"
#$credentials = Get-Credential
#$userID = "34c49619-211d-4383-bc27-7ec888f28c8f"
#$secret = "pa08Q~n4Ps2h5blo8Y6UxMJ~vl.SROCiCCbjsc8s"
#Connect-AzAccount -ServicePrincipal -Credential $credentials -TenantId $tenantid -Environment AzureCloud -Subscription $subscriptionid

$rg = "Modul-09-Oving"
$location = "North Europe"
#Oppretter en ny Resource Group med navn og location definert ovenfor i variabelene $rg og $location
New-AzResourceGroup -Name $rg -Location $location -Force
#Oppretter en ny deployment som henter verdier til parametere fra parameterfilen(e).
New-AzResourceGroupDeployment `
    -Name "M9-NestedAndLinkedTemplates" `
    -ResourceGroupName $rg `
    -TemplateFile '.\Modul 9 - ARM Templates Del 7\M9_Nested&LinkedTemplates.json' `

#Kommandoen nedenfor brukes for å slette RG jeg benytter i modulen
#Remove-AzResourceGroup -Name $rg -Force:$true