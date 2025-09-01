local set = vim.keymap.set

-- Clear highlights
set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- use jk to exit insert mode
set('i', 'jk', '<ESC>')
set('i', 'kj', '<ESC>')

set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })

-- TODO: Check if to keep this keymap from kickstart
-- Diagnostic keymaps
set('n', '<leader>q', vim.diagnostic.setloclist, {
  desc = 'Open diagnostic [Q]uickfix list',
})

-- delete single character without copying into register
set('n', 'x', '"_x')

-- Paste over and keep clipboard
set('x', 'p', [["_dP]])

-- -- Copy to system clipboard
-- set({ "n", "v" }, "<leader>y", [["+y]])
-- set("n", "<leader>Y", [["+Y]])
--
-- -- Paste from system clipboard
-- set({ "n", "v" }, "<leader>p", [["+p]])
-- set("n", "<leader>P", [["+P]])

-- Delete to void register
set({ 'n', 'v' }, '<leader>d', [["_d]])

-- Add undo break-points
set('i', ':', ':<c-g>u')
set('i', '<CR>', '<CR><c-g>u')

-- increment/decrement numbers
set('n', '+', '<C-a>') -- increment
set('n', '-', '<C-x>') -- decrement

set('v', 'J', ":m '>+1<CR>gv=gv", { silent = true })
set('v', 'K', ":m '<-2<CR>gv=gv", { silent = true })

-- Override moving between windows to use Tmux support
local function smart_move(direction, tmux_cmd)
  local curwin = vim.api.nvim_get_current_win()
  vim.cmd('wincmd ' .. direction)
  if curwin == vim.api.nvim_get_current_win() then
    vim.fn.system('tmux select-pane ' .. tmux_cmd)
  end
end

vim.keymap.set('n', '<C-h>', function()
  smart_move('h', '-L')
end, { silent = true })
vim.keymap.set('n', '<C-j>', function()
  smart_move('j', '-D')
end, { silent = true })
vim.keymap.set('n', '<C-k>', function()
  smart_move('k', '-U')
end, { silent = true })
vim.keymap.set('n', '<C-l>', function()
  smart_move('l', '-R')
end, { silent = true })

-- Resize windows
set('n', '<C-w>j', ':resize -2<CR>', { silent = true })
set('n', '<C-w>k', ':resize +2<CR>', { silent = true })
set('n', '<C-w>h', ':vertical resize -2<CR>', { silent = true })
set('n', '<C-w>l', ':vertical resize +2<CR>', { silent = true })

-- Indent tab mappings
-- set("n", "<Tab>", ">>_")
set('n', '<S-Tab>', '<<_')
set('i', '<S-Tab>', '<C-D>')
set('v', '<Tab>', '>gv')
set('v', '<S-Tab>', '<gv')

-- Open alternative file
set('n', 'ö', ':e#<CR>', { silent = true })
set('n', '\\', ':e#<CR>', { silent = true })

-- restart LSP
set('n', '<leader>cL', ':LspRestart<CR>', { silent = true, desc = 'Restart the LSP server' })

-- Toggle virtual text
set('n', '<leader>uv', function()
  vim.diagnostic.config {
    virtual_lines = false,
    virtual_text = not vim.diagnostic.config().virtual_text,
  }
end, { desc = 'Toggle virtual text' })

-- Toggle virtual lines
set('n', '<leader>uV', function()
  vim.diagnostic.config {
    virtual_text = false,
    virtual_lines = not vim.diagnostic.config().virtual_lines,
  }
end, { desc = 'Toggle virtual lines' })

set('n', '<leader>L', ':Lazy<CR>', { desc = 'Lazy', silent = true })

set('n', '<leader>cm', ':Mason<CR>', { desc = 'Mason', silent = true })
-- Toggle git line blame
-- set("n", "<leader>ub", ":Gitsigns toggle_current_line_blame<CR>", { desc = "Toggle Git blame", silent = true })
--
-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
-- vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

require 'config/lsp-keymaps'
