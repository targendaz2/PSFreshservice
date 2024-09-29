class FsQuestion {
    [string]$QuestionText
}

class FsAnswer {
    [string]$AnswerText
}

class FsQuestionnaireResponse {
    [FsQuestion]$Question
    [FsAnswer[]]$Answers
}

class FsCsat {
    [int]$Id
    [string]$OverallRatingText
    [int]$OverallRating
    [string]$PrimaryQuestion
    [FsQuestionnaireResponse[]]$QuestionnaireResponses
    [datetime]$CreatedAt
    [datetime]$UpdatedAt
}
