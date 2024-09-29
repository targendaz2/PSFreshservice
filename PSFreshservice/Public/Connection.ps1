function Connect-FsApi {
    param(
        [Parameter(Mandatory)]
        [string]$Domain,
        [Parameter(Mandatory)]
        [string]$ApiKey
    )

    $EncodedCredential = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(("$($ApiKey):X")))

    New-Variable `
        -Name FsUrl `
        -Value "https://$($Domain).freshservice.com/api/v2" `
        -Option ReadOnly `
        -Scope Global

    New-Variable `
        -Name FsCredential `
        -Value $EncodedCredential `
        -Option ReadOnly `
        -Scope Global

    if (-not (Test-FsApi)) {
        Write-Error 'Unable to connect to the Freshservice API'
        Disconnect-FsApi
    }
}

function Test-FsApi {
    $Response = Invoke-WebRequest `
        -Uri "$FsUrl/tickets" `
        -Headers @{ Authorization = "Basic $FsCredential" } `
        -Body @{ per_page = '1' } `
        -Method Get `
        -ContentType 'application/json'

    if ($Response.StatusCode -eq 200) {
        $true
    } else {
        $false
    }
}

function Disconnect-FsApi {
    Remove-Variable 'FsUrl' -Scope Global -Force
    Remove-Variable 'FsCredential' -Scope Global -Force
}
