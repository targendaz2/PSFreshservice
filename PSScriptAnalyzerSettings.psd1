@{
    # Only diagnostic records of the specified severity will be generated.
    # Uncomment the following line if you only want Errors and Warnings but
    # not Information diagnostic records.
    #
    # Severity = @('Error', 'Warning')

    # Analyze **only** the following rules. Use IncludeRules when you want
    # to invoke only a small subset of the default rules.
    IncludeRules = @(
        'PSUseApprovedVerbs',
        'AvoidReservedCharInCmdlet',
        'AvoidReservedParams',
        'UseShouldProcessForStateChangingFunctions',
        'UseShouldProcess',
        'UseSingularNouns',
        'MissingModuleManifestField',
        'AvoidDefaultValueSwitchParameter'
        'AvoidUsingCmdletAliases',
        'AvoidUsingWMICmdlet',
        'AvoidUsingEmptyCatchBlock',
        'UseCmdletCorrectly',
        'AvoidUsingPositionalParameters',
        'AvoidGlobalVars',
        'UseDeclaredVarsMoreThanAssignments',
        'AvoidUsingInvokeExpression',
        'AvoidUsingWriteHost',
        'ProvideCommentHelp',
        'AvoidUsingPlainTextForPassword',
        'UsePSCredentialType',
        'AvoidUsingComputerNameHardcoded',
        'AvoidUsingConvertToSecureStringWithPlainText',
        'AvoidUsingUsernameAndPasswordParams'
    )

    # Do not analyze the following rules. Use ExcludeRules when you have
    # commented out the IncludeRules settings above and want to include all
    # the default rules except for those you exclude below.
    # Note that if a rule is in both IncludeRules and ExcludeRules, the rule
    # will be excluded.
    #
    # ExcludeRules = @('TypeNotFound')

    # You can use rule configuration to configure rules that support it:
    #
    # Rules = @{
    #     PSAvoidUsingCmdletAliases = @{
    #         AllowList = @("cd")
    #     }
    # }
}
