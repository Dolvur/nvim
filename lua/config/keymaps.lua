local set = vim.keymap.set

-- vim.pack
set('n', '<leader>cp', function()
  vim.pack.update()
end, { desc = 'vim.pack update' })

-- Clear highlights
set('n', '<Esc>', '<cmd>nohlsearch<CR>')

set('v', 'J', ":m '>+1<CR>gv=gv", { silent = true })
set('v', 'K', ":m '<-2<CR>gv=gv", { silent = true })

-- Open alternative file
set('n', 'ö', ':e#<CR>', { silent = true })
set('n', '\\', ':e#<CR>', { silent = true })

-- indent tab mappings
set('n', '<S-Tab>', '<<_')
set('i', '<S-Tab>', '<C-D>')
set('v', '<Tab>', '>gv')
set('v', '<S-Tab>', '<gv')

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

vim.keymap.set({ 'x', 'o' }, 'v', function()
  if vim.treesitter.get_parser(nil, nil, { error = false }) then
    require('vim.treesitter._select').select_parent(vim.v.count1)
  else
    vim.lsp.buf.selection_range(vim.v.count1)
  end
end)

vim.keymap.set({ 'x', 'o' }, 'V', function()
  if vim.treesitter.get_parser(nil, nil, { error = false }) then
    require('vim.treesitter._select').select_child(vim.v.count1)
  else
    vim.lsp.buf.selection_range(-vim.v.count1)
  end
end)
