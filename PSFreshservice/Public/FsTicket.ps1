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
    Medium
    High
    Urgent = 4
}

enum FsTicketSource {
    Email = 1
    Portal
    Phone
    Chat
    FeedbackWidget
    Yammer
    AwsCloudwatch
    Pagerduty
    Walkup
    Slack = 10
}

enum FsTicketStatus {
    Open = 2
    Pending
    Resolved
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

    Invoke-FsRequest
}

function Get-FsTicket {
    [CmdletBinding(SupportsShouldProcess)]
    param(
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
}

function Set-FsTicket {
    [CmdletBinding(SupportsShouldProcess)]
    param(
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
}

function Move-FsTicket {

}

function Remove-FsTicket {

}

function Remove-FsTicketAttachment {

}

function Restore-FsTicket {

}
