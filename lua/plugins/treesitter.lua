vim.pack.add {
  'https://github.com/nvim-treesitter/nvim-treesitter',
}

require('nvim-treesitter').install {
  'json',
  'javascript',
  'typescript',
  'tsx',
  'yaml',
  'html',
  'css',
  'markdown',
  'markdown_inline',
  'svelte',
  'graphql',
  'bash',
  'lua',
  'vim',
  'dockerfile',
  'gitignore',
  'query',
  'vimdoc',
  'c',
  'cpp',
  'csv',
  'python',
  'diff',
  'gitcommit',
}

local group = vim.api.nvim_create_augroup('TreesitterSetup', { clear = true })
vim.api.nvim_create_autocmd('FileType', {
  group = group,
  desc = 'Enable treesitter when a language exists for this filetype',
  callback = function(event)
    local ft = vim.bo[event.buf].filetype
    if ft == '' then
      return
    end

    local lang = vim.treesitter.language.get_lang(ft)
    if not lang then
      -- No TS language for this filetype => don't start, don't install, no warnings.
      return
    end

    -- Start highlighting
    pcall(vim.treesitter.start, event.buf, lang)

    -- Optional: only set indentexpr if you really want TS indent everywhere it exists
    vim.bo[event.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

    -- folds using treesitter
    -- vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
    -- vim.wo.foldmethod = 'expr'
  end,
})
