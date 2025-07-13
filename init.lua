vim.g.mapleader = " "

-- lazy plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    lazypath
  })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")

-- Configs not dependent on Plugins.
-- Can be replicated in bear vim.
require("user.indent")
require("user.editor")
require("user.netrw")
require("user.keybindings")
