vim.g.mapleader = ' '
vim.g.maplocalleader = ','
vim.g.have_nerd_font = true
-- vim.loader.enable()

require 'core.mason-path'
require 'core.lsp'

require 'config.options'
require 'config.autocmds'
require 'config.keymaps'

-- plugin-manager init
require 'config.lazy'

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
