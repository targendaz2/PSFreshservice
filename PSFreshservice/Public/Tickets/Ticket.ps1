enum FsTicketFilter {
    NewAndMyOpen = 'new_and_my_open'
    Watching = 'watching'
    Spam = 'spam'
    Deleted = 'deleted'
}

enum FsTicketInclude {
    Conversations = 'conversations'
    Requester = 'requester'
    RequestedFor = 'requested_for'
    Stats = 'stats'
    Problem = 'problem'
    Assets = 'assets'
    Change = 'change'
    RelatedTickets = 'related_tickets'
    OnboardingContext = 'onboarding_context'
    OffboardingContext = 'offboarding_context'
}

enum FsTicketOrderType {
    Ascending = 'asc'
    Descending = 'desc'
}

enum FsTicketPriority {
    Low = 1
    Medium = 2
    High = 3
    Urgent = 4
}

enum FsTicketSource {
    Email = 1
    Portal = 2
    Phone = 3
    Chat = 4
    FeedbackWidget = 5
    Yammer = 6
    AwsCloudwatch = 7
    Pagerduty = 8
    Walkup = 9
    Slack = 10
}

enum FsTicketStatus {
    Open = 2
    Pending = 3
    Resolved = 4
    Closed = 5
}

enum FsTicketType {
    Incident = 'Incident'
    ServiceRequest = 'Service+Request'
}

function New-FsTicket {
    [CmdletBinding(SupportsShouldProcess)]
    param(
        [int]$WorkspaceId,
        [string[]]$CcEmails,
        [int]$DepartmentId,
        [hashtable]$CustomFields,
        [string]$Description,
        [string]$Email,
        [int]$EmailConfigId,
        [int]$GroupId,
        [string]$Name,
        [string]$Phone,
        [FsTicketPriority]$Priority,
        [string]$Category,
        [string]$SubCategory,
        [string]$ItemCategory,
        [int]$RequesterId,
        [FsTicketSource]$Source,
        [FsTicketStatus]$Status,
        [string]$Subject,
        [string[]]$Tags,
        [int]$Urgency,
        [int]$Impact,
        [string]$ResolutionNotes
    )

    Invoke-FsRequest '/tickets' `
        -Method Post `
        -Confirm:$ConfirmPreference `
        -WhatIf:$WhatIfPreference
}

function Get-FsTicket {
    [CmdletBinding(SupportsShouldProcess)]
    param(
        [Parameter(Position = 0)]
        [int]$Id,
        [FsTicketInclude[]]$Include,
        [string]$Filter,
        [FsTicketFilter]$PredefinedFilter,
        [int]$RequesterId,
        [string]$Email,
        [datetime]$UpdatedSince,
        [FsTicketType]$Type,
        [int]$WorkspaceId,
        [FsTicketOrderType]$OrderType
    )

    Invoke-FsRequest '/tickets' `
        -Method Get `
        -Confirm:$ConfirmPreference `
        -WhatIf:$WhatIfPreference
}

function Set-FsTicket {
    [CmdletBinding(SupportsShouldProcess)]
    param(
        [Parameter(Mandatory, Position = 0)]
        [int]$Id,
        [switch]$BypassMandatory,
        [int]$WorkspaceId,
        [FsAttachment[]]$Attachments,
        [string[]]$CcEmails,
        [int]$DepartmentId,
        [hashtable]$CustomFields,
        [string]$Description,
        [string]$Email,
        [int]$EmailConfigId,
        [int]$GroupId,
        [string]$Name,
        [string]$Phone,
        [FsTicketPriority]$Priority,
        [string]$Category,
        [string]$SubCategory,
        [string]$ItemCategory,
        [int]$RequesterId,
        [FsTicketSource]$Source,
        [FsTicketStatus]$Status,
        [string]$Subject,
        [string[]]$Tags,
        [int]$Urgency,
        [int]$Impact,
        [string]$ResolutionNotes
    )

    Invoke-FsRequest "/tickets/$($Id)" `
        -Method Put `
        -Confirm:$ConfirmPreference `
        -WhatIf:$WhatIfPreference
}

function Move-FsTicket {
    [CmdletBinding(SupportsShouldProcess)]
    param(
        [Parameter(Mandatory, Position = 0)]
        [int]$Id,
        [Parameter(Mandatory)]
        [int]$WorkspaceId,
        [int]$GroupId,
        [int]$ResponderId
    )

    Invoke-FsRequest "/tickets/$($Id)/move_workspace" `
        -Method Put `
        -Confirm:$ConfirmPreference `
        -WhatIf:$WhatIfPreference
}

function Remove-FsTicket {
    [CmdletBinding(SupportsShouldProcess)]
    param(
        [Parameter(Mandatory, Position = 0)]
        [int]$Id
    )

    Invoke-FsRequest "/tickets/$($Id)" `
        -Method Delete `
        -Confirm:$ConfirmPreference `
        -WhatIf:$WhatIfPreference
}

function Restore-FsTicket {
    [CmdletBinding(SupportsShouldProcess)]
    param(
        [Parameter(Mandatory, Position = 0)]
        [int]$Id
    )

    Invoke-FsRequest "/tickets/$($Id)/restore" `
        -Method Put `
        -Confirm:$ConfirmPreference `
        -WhatIf:$WhatIfPreference
}
