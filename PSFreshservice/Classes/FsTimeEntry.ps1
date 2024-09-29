class FsTimeEntry {
    [int]$Id
    [int]$WorkspaceId
    [datetime]$CreatedAt
    [datetime]$UpdatedAt
    [datetime]$StartTime
    [switch]$TimerRunning
    [switch]$Billable
    [string]$TimeSpent
    [datetime]$ExecutedAt
    [int]$TaskId
    [string]$Note
    [int]$AgentId
}
