require 'config.options'
require 'config.autocmds'
require 'config.keymaps'
require 'config.lsp'
require 'config.lsp-keymaps'

require 'plugins.colorscheme' -- Load first so colorscheme is inherited
require 'plugins.mini' -- Load early since it contains setup
require 'plugins.treesitter'
require 'plugins.whichkey'
require 'plugins.lsp'
require 'plugins.explorer'
require 'plugins.fzf'
require 'plugins.git'
require 'plugins.conform'
-- require 'plugins.rainbow-delimiters'


vim.lsp.enable({'lua_ls'})

