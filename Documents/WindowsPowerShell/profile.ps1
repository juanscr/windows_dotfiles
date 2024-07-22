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

# Do not emit sound when error
Set-PSReadLineOption -BellStyle Visual

# ===== Aliases ===== #
#
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
Set-Alias -name gb -Value GitAdd

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

Function GitRemove {GitCommand rm @args}
Set-Alias -name gr -Value GitRemove

Function GitRestoreStaged {GitCommand restore --staged @args}
Set-Alias -name grs -Value GitRestoreStaged

Function GitStatus {GitCommand status}
Set-Alias -name gs -Value GitStatus

# Neovim
Function Neovim {nvim @args}
Set-Alias -name n -Value Neovim

# ===== Prompt ===== #
function Write-BranchName () {
	$branch = git rev-parse --abbrev-ref HEAD
	if (! $branch) {
		return
	}

	if ($branch -eq "HEAD") {
		# we're probably in detached HEAD state, so print the SHA
		$branch = git rev-parse --short HEAD
		Write-Host "($branch) " -ForegroundColor "red" -NoNewline
		return
	}

	Write-Host "($branch) " -ForegroundColor "green" -NoNewline
}

function prompt {
    Write-BranchName
    $path = "$(Split-Path -leaf -path (Get-Location)) "
    Write-Host $path -NoNewline -ForegroundColor "blue"
    $userPrompt = "$('>') "
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

# Always spawn in home directory
cd ~
