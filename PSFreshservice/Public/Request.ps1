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
        -Uri "$($FsUrl)/$($Resource)" `
        -Headers @{ Authorization = "Basic $FsCredential" } `
        -Method $Method `
        -ContentType 'application/json'

    if ($Response.StatusCode -ne 200) {
        Write-Error 'Unable to complete request'
    } else {
        $Response.Content
    }
}
