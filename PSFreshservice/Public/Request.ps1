function Invoke-FsRequest {
    [CmdletBinding(SupportsShouldProcess)]
    param (
        [Parameter(Mandatory, Position = 0)]
        [string]$Resource,
        [Microsoft.PowerShell.Commands.WebRequestMethod]$Method = 'Get',
        [hashtable]$Params,
        [hashtable]$Body,
        [ValidateRange(1, 100)]
        [int]$PerPage,
        [ValidateRange('Positive')]
        [int]$Page
    )

    $Response = Invoke-WebRequest `
        -Uri "$($FsUrl)$($Resource)" `
        -Headers @{ Authorization = "Basic $FsCredential" } `
        -Method $Method `
        -ContentType 'application/json' `
        -Confirm:$ConfirmPreference `
        -WhatIf:$WhatIfPreference

    switch ($Response.StatusCode) {
        200 { $Response.Content }
        204 { return }
        default { Write-Error 'Unable to complete request' }
    }
}
