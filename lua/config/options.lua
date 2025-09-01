-- See `:help vim.o`
-- For more options, you can see `:help option-list`

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

vim.g.snacks_animate = false
-- vim.o.cursorcolumn = true
vim.o.colorcolumn = '80'

vim.o.cursorline = true

vim.o.termguicolors = true
vim.o.background = 'dark'

vim.o.splitright = true
vim.o.splitbelow = true

vim.o.virtualedit = 'block'

vim.o.cmdheight = 0

vim.o.laststatus = 3 -- Always statusline at bottom

vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

vim.o.inccommand = 'split'
vim.o.number = true
vim.o.relativenumber = true

vim.o.scrolloff = 4

vim.o.mouse = 'a'
-- vim.diagnostic.config({ virtual_text = false })

vim.o.showmode = false

vim.o.breakindent = true
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250

-- Decrease mapped sequence wait time
vim.o.timeoutlen = 300

vim.o.confirm = true

vim.o.timeoutlen = 2000 -- Increase timeout for e.g. mini.surround
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.autoindent = true

vim.opt.winborder = "rounded"
