--[[
TODO: look through this a bit more:

  Next, run AND READ `:help`.
    This will open up a help window with some basic information
    about reading, navigating and searching the builtin help documentation.

    This should be the first place you go to look when you're stuck or confused
    with something. It's one of my favorite Neovim features.

    MOST IMPORTANTLY, we provide a keymap "<space>sh" to [s]earch the [h]elp documentation,
    which is very useful when you're not exactly sure of what you're looking for.

  I have left several `:help X` comments throughout the init.lua
    These are hints about where to find more information about the relevant settings,
    plugins or Neovim features used in Kickstart.


If you experience any errors while trying to install kickstart, run `:checkhealth` for more info.
--]]
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
