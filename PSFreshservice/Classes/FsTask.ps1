enum FsTaskStatus {
    Open = 1
    InProgress
    Completed = 3
}

class FsTask {
    [int]$Id
    [int]$AgentId
    [FsTaskStatus]$Status
    [datetime]$DueDate
    [int]$NotifyBefore
    [string]$Title
    [string]$Description
    [datetime]$CreatedAt
    [datetime]$UpdatedAt
    [datetime]$ClosedAt
    [int]$GroupId
}
