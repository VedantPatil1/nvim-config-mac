-- Create autocommands for different filetypes
local indent_settings = {
  lua = { shiftwidth = 2, tabstop = 2, softtabstop = 2, expandtab = true },
  python = { shiftwidth = 4, tabstop = 4, softtabstop = 4, expandtab = true },
  javascript = { shiftwidth = 2, tabstop = 2, softtabstop = 2, expandtab = true },
  html = { shiftwidth = 2, tabstop = 2, softtabstop = 2, expandtab = true },
  make = { shiftwidth = 8, tabstop = 8, softtabstop = 0, expandtab = false }, -- Use tabs in Makefiles
}

for ft, opts in pairs(indent_settings) do
  vim.api.nvim_create_autocmd("FileType", {
    pattern = ft,
    callback = function()
      vim.opt_local.shiftwidth = opts.shiftwidth
      vim.opt_local.tabstop = opts.tabstop
      vim.opt_local.softtabstop = opts.softtabstop
      vim.opt_local.expandtab = opts.expandtab
    end,
  })
end

