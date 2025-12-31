--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- Save view when leaving a buffer, restore it when entering
-- Fixing window moving when toggling alternative file!
vim.api.nvim_create_autocmd({ 'BufWinLeave' }, {
  pattern = '*',
  command = 'silent! mkview',
})
vim.api.nvim_create_autocmd({ 'BufWinEnter' }, {
  pattern = '*',
  command = 'silent! loadview',
})

-- -- Restore cursor position when reopening a file
-- Annoying with alternative file
-- vim.api.nvim_create_autocmd('BufReadPost', {
--   desc = 'Restore cursor position when reopening a file',
--   group = vim.api.nvim_create_augroup('restore-cursor-position', { clear = true }),
--   callback = function(args)
--     local mark = vim.api.nvim_buf_get_mark(args.buf, '"')
--     local line_count = vim.api.nvim_buf_line_count(args.buf)
--     if mark[1] > 0 and mark[1] <= line_count then
--       vim.api.nvim_win_set_cursor(0, mark)
--       -- defer centering slightlty so it is applied after render
--       vim.schedule(function()
--         vim.cmd('normal! zz')
--       end)
--     end
--   end,
-- })
--
-- open help in a vertical split
vim.api.nvim_create_autocmd('FileType', {
  desc = 'Open help in a vertical split',
  group = vim.api.nvim_create_augroup('help-vertical-split', { clear = true }),
  pattern = 'help',
  callback = function()
    vim.cmd.wincmd 'L'
  end,
})

-- -- no auto continue comments on new lines
-- vim.api.nvim_create_autocmd('BufEnter', {
--   desc = 'No auto continue comments on new lines',
--   group = vim.api.nvim_create_augroup('no-auto-continue-comments', { clear = true }),
--   callback = function()
--     vim.cmd 'setlocal formatoptions-=c formatoptions-=r formatoptions-=o'
--   end,
-- })

-- close some filetypes with <q>
vim.api.nvim_create_autocmd('FileType', {
  desc = 'Close some filetypes with <q>',
  group = vim.api.nvim_create_augroup('close-with-q', { clear = true }),
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

-- -- Resize splits when the vim window is resized
-- vim.api.nvim_create_autocmd('VimResized', {
--   desc = 'Resize splits when the vim window is resized',
--   group = vim.api.nvim_create_augroup('resize-splits', { clear = true }),
--   callback = function()
--     vim.cmd 'tabdo wincmd ='
--   end,
-- })

-- DirDiff command to compare two directories
vim.api.nvim_create_user_command('DirDiff', function(opts)
  if vim.tbl_count(opts.fargs) ~= 2 then
    vim.notify('DirDiff requires exactly two directory arguments', vim.log.levels.ERROR)
    return
  end

  vim.cmd 'tabnew'
  vim.cmd.packadd 'nvim.difftool'
  require('difftool').open(opts.fargs[1], opts.fargs[2], {
    rename = {
      detect = false,
    },
    ignore = { '.git' },
  })
end, { complete = 'dir', nargs = '*' })
