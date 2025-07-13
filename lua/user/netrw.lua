vim.g.netrw_banner = 0        -- Disable annoying banner
vim.g.netrw_liststyle = 3     -- Tree-style listing (like nvim-tree)
vim.g.netrw_browse_split = 0  -- Open files in the same window
vim.g.netrw_winsize = 25      -- Set window size to 25%
vim.g.netrw_altv = 1          -- Vertical splits open to the right
vim.g.netrw_keepdir = 0       -- Don’t auto-cd into dir
vim.g.netrw_localcopydircmd = 'cp -r' -- Recursive copy

-- Optional: hide dotfiles (toggle with `gh`)
vim.g.netrw_list_hide = '^\\..*'

-- Set netrw as default file explorer (in case another plugin tries to override it)
vim.g.loaded_netrwPlugin = 1

