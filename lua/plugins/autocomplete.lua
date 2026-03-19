vim.pack.add {
  { src = 'https://github.com/L3MON4D3/LuaSnip', version = vim.version.range '2.x' },
  'https://github.com/rafamadriz/friendly-snippets',
  { src = 'https://github.com/saghen/blink.cmp', version = vim.version.range '1.x' },
}

require('luasnip.loaders.from_vscode').lazy_load()

require('blink.cmp').setup {
  keymap = { preset = 'default' },

  appearance = {
    nerd_font_variant = 'mono',
  },
  completion = { documentation = { auto_show = false } },
  sources = {
    default = { 'lazydev', 'lsp', 'path', 'snippets', 'buffer' },
    providers = {
      lazydev = {
        name = 'LazyDev',
        module = 'lazydev.integrations.blink',
        score_offset = 100,
      },
    },
  },
  signature = { enabled = true },
  cmdline = {
    enabled = false,
    completion = {
      menu = { auto_show = true },
    },
  },
  fuzzy = { implementation = 'prefer_rust_with_warning' },
}
