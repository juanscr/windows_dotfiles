# ===== Aliases ===== #
#
# Ls with icons
Function ListFiles {eza --icons --ignore-glob="__pycache__" --group-directories-first $args}
New-Alias -name ls -Value ListFiles -Force -Option AllScope

# Dotfiles access
Function DotfilesGit {git --git-dir=$HOME\Documents\personal\windows_dotfiles.git\ --work-tree=$HOME $args}
Set-Alias -name dfiles -Value DotfilesGit

# All git aliases
Function GitCommand() {
	$isInGitDirectory = git rev-parse --git-dir -q 2> $null
	if ($?) {
		git $args
	} else {
		git --git-dir=$HOME\Documents\personal\windows_dotfiles.git\ --work-tree=$HOME $args
	}
}

Function GitAdd {GitCommand add $args}
Set-Alias -name ga -Value GitAdd

Function GitBranch {GitCommand branch $args}
Set-Alias -name gb -Value GitAdd

Function GitCheckout {GitCommand checkout $args}
Set-Alias -name gc -Value GitCheckout -Force -Option AllScope

Function GitCommitAll {GitCommand commit -a}
Set-Alias -name gca -Value GitCommitAll

Function GitClone {GitCommand clone $args}
Set-Alias -name gcl -Value GitClone

Function GitCommitMessage {GitCommand commit -m $args}
Set-Alias -name gcm -Value GitCommitMessage -Force -Option AllScope

Function GitDiff {GitCommand diff $args}
Set-Alias -name gd -Value GitDiff

Function GitPush {GitCommand push $args}
Set-Alias -name gp -Value GitPush -Force -Option AllScope

Function GitRemove {GitCommand rm $args}
Set-Alias -name gr -Value GitRemove

Function GitRestoreStaged {GitCommand restore --staged $args}
Set-Alias -name grs -Value GitRestoreStaged

Function GitStatus {GitCommand status}
Set-Alias -name gs -Value GitStatus

# Neovim
Function Neovim {nvim $args}
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

	Write-Host "($branch) " -ForegroundColor "blue" -NoNewline
}

function prompt {
    Write-BranchName
    $path = "$($executionContext.SessionState.Path.CurrentLocation) "
    Write-Host $path -NoNewline -ForegroundColor "green"
    $userPrompt = "$('>') "
    return $userPrompt
}
