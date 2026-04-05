vim.pack.add {
  'https://github.com/nvim-mini/mini.nvim',
}

-- TODO: Read up more on what this changes
require('mini.basics').setup {
  options = {
    extra_ui = true,
  },
  mappings = {
    basic = false,
    option_toggle_prefix = '<leader>u',
    windows = false,
  },
}

require('mini.misc').setup()
MiniMisc.setup_auto_root()
MiniMisc.setup_termbg_sync() -- Sync background with terminal background, fix borders
MiniMisc.setup_restore_cursor()

require('mini.icons').setup()
require('mini.ai').setup {
  n_lines = 500,
}
require('mini.surround').setup()
require('mini.bracketed').setup()
require('mini.pairs').setup()
require('mini.splitjoin').setup()
require('mini.cursorword').setup()
require('mini.notify').setup()

require('mini.cmdline').setup()
local sessions = require 'mini.sessions'
sessions.setup()
vim.keymap.set('n', '<leader>Sc', function()
  vim.ui.input({ prompt = 'Create session: ' }, function(value)
    if value == nil then
      return
    end
    sessions.write(value)
  end)
end, { desc = 'Create session' })
vim.keymap.set('n', '<leader>So', function()
  sessions.select()
end, { desc = 'Open session' })
vim.keymap.set('n', '<leader>Sd', function()
  sessions.select 'delete'
end, { desc = 'Delete session' })
-- require('mini.sessions').select
local starter = require 'mini.starter'
starter.setup {
  evaluate_single = true,
  items = {
    starter.sections.builtin_actions(),
    starter.sections.sessions(5, true),
    starter.sections.recent_files(10, false),
    starter.sections.recent_files(10, true),
  },
  content_hooks = {
    starter.gen_hook.adding_bullet(),
    starter.gen_hook.indexing('all', { 'Builtin actions' }),
    starter.gen_hook.padding(3, 2),
  },
}
local statusline = require 'mini.statusline'
statusline.setup { use_icons = vim.g.have_nerd_font }
---@diagnostic disable-next-line: duplicate-set-field
statusline.section_location = function()
  return '%2l:%-2v'
end
local indentscope = require 'mini.indentscope'
indentscope.setup {
  draw = {
    delay = 10,
    animation = indentscope.gen_animation.none(),
  },
  symbol = '│',
}
local hipatterns = require 'mini.hipatterns'
hipatterns.setup {
  highlighters = {
    -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
    fixme = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
    hack = { pattern = '%f[%w]()HACK()%f[%W]', group = 'MiniHipatternsHack' },
    todo = { pattern = '%f[%w]()TODO()%f[%W]', group = 'MiniHipatternsTodo' },
    note = { pattern = '%f[%w]()NOTE()%f[%W]', group = 'MiniHipatternsNote' },

    -- Highlight hex color strings (`#rrggbb`) using that color
    hex_color = hipatterns.gen_highlighter.hex_color(),
  },
}
local miniclue = require 'mini.clue'
miniclue.setup {
  triggers = {
    { mode = 'n', keys = '<leader>' },
    { mode = 'n', keys = 'g' },
    { mode = 'n', keys = '<C-W>' },
    { mode = 'i', keys = '<C-x>' },
    { mode = { 'n', 'x' }, keys = 'z' },

    { mode = 'n', keys = '[' },
    { mode = 'n', keys = ']' },

    -- Registers
    { mode = { 'n', 'x' }, keys = '"' },
    { mode = { 'i', 'c' }, keys = '<C-r>' },
  },

  clues = {
    miniclue.gen_clues.g(),
    miniclue.gen_clues.windows { submode_resize = true },
    miniclue.gen_clues.builtin_completion(),
    miniclue.gen_clues.registers(),
    miniclue.gen_clues.z(),
    miniclue.gen_clues.square_brackets(),
  },

  window = {
    delay = 300,
    config = {
      width = 'auto',
      height = 10,
      border = 'single',
      col = 'auto',
      row = 'auto',
    },
  },
}
