enum FsApprovalType {
    ToBeApprovedByEveryone = 1
    ToBeApprovedByAnyone
    ToBeApprovedByMajority
    ToBeApprovedByFirstResponder = 4
}

enum FsApprovalStatus {
    Requested = 0
    Approved
    Rejected
    Cancelled = 3
}

class FsApproval {
    [int]$Id
    [datetime]$CreatedAt
    [datetime]$UpdatedAt
    [int]$ApproverId
    [string]$ApproverName
    [FsApprovalType]$ApprovalType
    [int]$UserId
    [string]$UserName
    [int]$Level
    [string]$ApprovalStatus
    [string]$Delegatee
    [string]$LatestRemark
    [string]$EmailContent
}
