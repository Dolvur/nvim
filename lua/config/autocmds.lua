--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- Restore cursor position when reopening a file
vim.api.nvim_create_autocmd('BufReadPost', {
  desc = 'Restore cursor position when reopening a file',
  group = vim.api.nvim_create_augroup('restore-cursor-position', { clear = true }),
  callback = function(args)
    local mark = vim.api.nvim_buf_get_mark(args.buf, '"')
    local line_count = vim.api.nvim_buf_line_count(args.buf)
    if mark[1] > 0 and mark[1] <= line_count then
      vim.api.nvim_win_set_cursor(0, mark)
      -- defer centering slightlty so it is applied after render
      vim.schedule(function()
        vim.cmd('normal! zz')
      end)
    end
  end,
})

-- open help in a vertical split
vim.api.nvim_create_autocmd('FileType', {
  desc = 'Open help in a vertical split',
  group = vim.api.nvim_create_augroup('help-vertical-split', { clear = true }),
  pattern = 'help',
  callback = function()
    vim.cmd.wincmd('L')
  end,
})

-- no auto continue comments on new lines
vim.api.nvim_create_autocmd('BufEnter', {
  desc = 'No auto continue comments on new lines',
  group = vim.api.nvim_create_augroup('no-auto-continue-comments', { clear = true }),
  callback = function()
    vim.cmd('setlocal formatoptions-=c formatoptions-=r formatoptions-=o')
  end,
})

-- close some filetypes with <q>
vim.api.nvim_create_autocmd('FileType', {
  desc = 'Close some filetypes with <q>',
  group = vim.api.nvim_create_augroup('close-with-q', { clear = true
  }),
  pattern = { 'help', 'man', 'qf', 'lspinfo', 'spectre_panel' },
  callback = function(args)
    vim.bo[args.buf].buflisted = false
    vim.keymap.set('n', 'q', '<cmd>close<cr>', {
      buffer = args.buf,
      silent = true,
      desc = 'Close window',
    })
  end,
})
