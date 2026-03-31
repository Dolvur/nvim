-- Callback-hook to run build hooks for certain plugins. This should be loaded before adding these plugins
vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind

    -- nvim-treesitter build
    if name == 'nvim-treesitter' and kind == 'update' then
      if not ev.data.active then
        vim.cmd.packadd 'nvim-treesitter'
      end
      vim.cmd 'TSUpdate'
    end

    -- LuaSnip build
    if name == 'LuaSnip' and (kind == 'install' or kind == 'update') then
      vim.system({ 'make', 'install_jsregexp' }, { cwd = ev.data.path }):wait()
    end
  end,
})

-- Use same colorscheme as terminal, no weird borders fix
-- NOTE: Currently using MiniMisc.setup_termbg_sync() instead
-- vim.api.nvim_create_autocmd({ 'UIEnter', 'ColorScheme' }, {
--   callback = function()
--     local normal = vim.api.nvim_get_hl(0, { name = 'Normal' })
--     if not normal.bg then
--       return
--     end
--     io.write(string.format('\027]11;#%06x\027\\', normal.bg))
--   end,
-- })
--
-- vim.api.nvim_create_autocmd('UILeave', {
--   callback = function()
--     io.write '\027]111\027\\'
--   end,
-- })
