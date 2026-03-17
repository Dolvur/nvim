vim.pack.add({
  'https://github.com/navarasu/onedark.nvim'
})

require('onedark').setup{
  style = 'darker',

  colors = {
    bg0 = '#000000',
    bg1 = '#1c1c1c',
  },
}

require('onedark').load()
