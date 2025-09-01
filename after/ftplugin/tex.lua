vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*.tex",
  callback = function()
    local file = vim.fn.expand("%")
    local dir = vim.fn.expand("%:p:h") -- Get file directory
    vim.fn.jobstart({ "xelatex", "-interaction=nonstopmode", file }, {
      cwd = dir,                       -- Set working directory
      detach = true
    })
  end,
})
