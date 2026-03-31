-- :help options-list

-- Apparently this can help startup-time to schedule this option
vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

vim.g.mapleader = ' '
vim.g.maplocalleader = ','
vim.g.have_nerd_font = true

vim.o.wrap = true

vim.o.termguicolors = true
vim.o.background = 'dark'

vim.o.relativenumber = true

vim.o.mouse = 'a'

vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.expandtab = true

vim.o.ignorecase = true
vim.o.smartcase = true

vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

vim.o.scrolloff = 4

-- vim.o.cmdheight = 0
vim.o.laststatus = 3

vim.o.inccommand = 'split'

vim.o.virtualedit = 'block'

vim.o.confirm = true

vim.o.showmode = false

vim.o.winborder = 'rounded'

-- folds
vim.o.foldmethod = 'indent'
vim.o.foldnestmax = 1
vim.o.foldlevelstart = 99
vim.o.foldopen = ''
vim.o.foldclose = ''

vim.opt.fillchars = {
  fold = ' ',
  foldopen = '',
  foldsep = ' ',
  foldclose = '',
}
