#$tenantid = "02feabb9-444e-4f66-9c13-6a8f04b75c2f"
#$subscriptionid = "efc1e7b1-5729-4eea-b33e-12cc6b1c0183"
#$credentials = Get-Credential
#$userID = "34c49619-211d-4383-bc27-7ec888f28c8f"
#$secret = "pa08Q~n4Ps2h5blo8Y6UxMJ~vl.SROCiCCbjsc8s"
#Connect-AzAccount -ServicePrincipal -Credential $credentials -TenantId $tenantid -Environment AzureCloud -Subscription $subscriptionid

$rg = "AlgorithmComputers-Eksamen-MDH"
$location = "West Europe"
#Oppretter en ny Resource Group med navn og location definert ovenfor i variabelene $rg og $location
New-AzResourceGroup -Name $rg -Location $location -Force

#Oppgave 1 - Proof of Concept
New-AzResourceGroupDeployment `
    -Name "Oppgave1_ProofOfConcept" `
    -ResourceGroupName $rg `
    -TemplateFile '.\EKSAMEN\Oppgave1\Oppgave1_AlgorithmComputers.json' `
    #-storageAccountName "saac" `
    #-location "North Europe" `
    #-storageAccountSKU "Standard_LRS" `
    #-serverFarmName "farmactest" `
    #-webAppName "appactest"

#Oppgave 2 - AC-Testmiljø
New-AzResourceGroupDeployment `
    -Name "Oppgave2_AC_Testmiljø" `
    -ResourceGroupName $rg `
    -TemplateFile '.\EKSAMEN\Oppgave2\Oppgave2_AlgorithmComputers.json' `
    -TemplateParameterFile '.\EKSAMEN\Oppgave2\Oppgave2_AlgorithmComputers.parameters-test.json' `
    -allowAzureIPs "Yes"

#Oppgave 2 - AC-Prodmiljø
New-AzResourceGroupDeployment `
    -Name "Oppgave2_AC_Prodmiljø" `
    -ResourceGroupName $rg `
    -TemplateFile '.\EKSAMEN\Oppgave2\Oppgave2_AlgorithmComputers.json' `
    -TemplateParameterFile '.\EKSAMEN\Oppgave2\Oppgave2_AlgorithmComputers.parameters-prod.json' `
    -allowAzureIPs "Yes"

#Oppgave 2 - AC-Devmiljø
New-AzResourceGroupDeployment `
    -Name "Oppgave2_AC_Devmiljø" `
    -ResourceGroupName $rg `
    -TemplateFile '.\EKSAMEN\Oppgave2\Oppgave2_AlgorithmComputers.json' `
    -TemplateParameterFile '.\EKSAMEN\Oppgave2\Oppgave2_AlgorithmComputers.parameters-dev.json' `
    -allowAzureIPs "Yes"

#Kommandoen nedenfor brukes for å slette RG jeg benytter for å teste under eksamen
#Remove-AzResourceGroup -Name $rg -Force:$true