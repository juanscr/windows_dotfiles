# Dotfiles access
Function DotfilesGit {git --git-dir=$HOME\Documents\personal\windows_dotfiles.git\ --work-tree=$HOME $args}
Set-Alias -name dfiles -Value DotfilesGit

# Neovim
Function Neovim {nvim $args}
Set-Alias -name n -Value nvim
