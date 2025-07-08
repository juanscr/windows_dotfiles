# ===== PSReadLine Module ===== #
Import-Module PSReadLine

# Keybinds for History
Set-PSReadLineKeyHandler -Key Alt+p -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key Alt+n -Function HistorySearchForward

# Vim-like movement through altbe
Set-PSReadLineKeyHandler -Key Alt+b -Function ShellBackwardWord
Set-PSReadLineKeyHandler -Key Alt+w -Function ShellForwardWord
Set-PSReadLineKeyHandler -Key Alt+0 -Function BeginningOfLine
Set-PSReadLineKeyHandler -Key Alt+4 -Function EndOfLine
Set-PSReadLineKeyHandler -Key Alt+h -Function BackwardChar
Set-PSReadLineKeyHandler -Key Alt+l -Function ForwardChar

# Copy and Paste
Set-PSReadLineKeyHandler -Key Ctrl+y -Function Copy
Set-PSReadLineKeyHandler -Key Ctrl+p -Function Paste

# Autocomplete
Set-PSReadLineKeyHandler -Key Tab -Function Complete
Set-PSReadLineKeyHandler -Key Ctrl+Spacebar -Function AcceptSuggestion

# Do not emit sound when error
Set-PSReadLineOption -BellStyle Visual

# ===== Aliases ===== #
# Ls with icons
Function ListFiles {eza --icons --ignore-glob="__pycache__" --group-directories-first @args}
New-Alias -name ls -Value ListFiles -Force -Option AllScope

# Dotfiles access
Function DotfilesGit {git --git-dir=$HOME\Documents\personal\windows_dotfiles.git\ --work-tree=$HOME @args}
Set-Alias -name dfiles -Value DotfilesGit

# All git aliases
Function GitCommand() {
	$isInGitDirectory = git rev-parse --git-dir -q 2> $null
	if ($?) {
		git @args
	} else {
		dfiles @args
	}
}
Set-Alias -name gitd -Value GitCommand

Function GitAdd {GitCommand add @args}
Set-Alias -name ga -Value GitAdd

Function GitBranch {GitCommand branch @args}
Set-Alias -name gb -Value GitBranch

Function GitCheckout {GitCommand checkout @args}
Set-Alias -name gc -Value GitCheckout -Force -Option AllScope

Function GitCommitAll {GitCommand commit -a}
Set-Alias -name gca -Value GitCommitAll

Function GitClone {git clone @args}
Set-Alias -name gcl -Value GitClone

Function GitCommitMessage {GitCommand commit -m @args}
Set-Alias -name gcm -Value GitCommitMessage -Force -Option AllScope

Function GitDiff {GitCommand diff @args}
Set-Alias -name gd -Value GitDiff

Function GitDiffTool {GitCommand difftool @args}
Set-Alias -name gdt -Value GitDiffTool

Function GitPush {GitCommand push @args}
Set-Alias -name gp -Value GitPush -Force -Option AllScope

Function GitPull {GitCommand pull @args}
Set-Alias -name gpl -Value GitPull -Force -Option AllScope

Function GitRemove {GitCommand rm @args}
Set-Alias -name gr -Value GitRemove

Function GitRestoreStaged {GitCommand restore --staged @args}
Set-Alias -name grs -Value GitRestoreStaged

Function GitStatus {GitCommand status}
Set-Alias -name gs -Value GitStatus

# Neovim
Function Neovim {nvim @args}
Set-Alias -name n -Value Neovim

# VS Code
Function VSCode {code @args}
Set-Alias -name c -Value VSCode

# ===== Prompt ===== #
function prompt {
    $path = "$(Split-Path -leaf -path (Get-Location)) "
    Write-Host $path -NoNewline -ForegroundColor "blue"
    $userPrompt = "$('>') "

	$branch = git rev-parse --abbrev-ref HEAD
    if (! $branch) {
        return $userPrompt
    }

    if ($branch -eq "HEAD") {
        $branch = git rev-parse --short HEAD
        Write-Host "($branch) " -ForegroundColor "red" -NoNewline
        return $userPrompt
    }
    Write-Host "($branch) " -ForegroundColor "green" -NoNewline
    return $userPrompt
}

# ===== Color Scheme Configuration (ColorTool + Dracula) ===== #
# Dracula readline configuration. Requires version 2.0, if you have 1.2 convert to `Set-PSReadlineOption -TokenType`
Set-PSReadlineOption -Color @{
    "Command" = [ConsoleColor]::Green
    "Parameter" = [ConsoleColor]::Gray
    "Operator" = [ConsoleColor]::Magenta
    "Variable" = [ConsoleColor]::White
    "String" = [ConsoleColor]::Yellow
    "Number" = [ConsoleColor]::Blue
    "Type" = [ConsoleColor]::Cyan
    "Comment" = [ConsoleColor]::DarkCyan
}

# Import things from other directory
$otherProfilePath = $PSScriptRoot + ".\Other_profile.ps1"
if (Test-Path $otherProfilePath) {
    & $otherProfilePath
}


# Import the Chocolatey Profile that contains the necessary code to enable
# tab-completions to function for `choco`.
# Be aware that if you are missing these lines from your profile, tab completion
# for `choco` will not function.
# See https://ch0.co/tab-completion for details.
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}
