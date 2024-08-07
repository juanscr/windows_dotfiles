vim.g.nofsync = true

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.termguicolors = true

vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "88"
vim.opt.scrolloff = 8
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

-- Trailing whitespace configuration
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    pattern = { "*" },
    command = [[%s/\s\+$//e]]
})
vim.cmd.match("TrailingSpaces /\\s\\+$/")
vim.cmd.highlight("TrailingSpaces ctermbg=red guibg=red")

-- Set workspace to first openned file
vim.api.nvim_create_autocmd({ "VimEnter" }, {
    pattern = { "*" },
    command = [[silent! cd %:p:h]]
})
