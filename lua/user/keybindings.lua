-- General keybindings
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Quick save and quit
keymap("n", "<leader>w", "<cmd>w<CR>", opts)
keymap("n", "<leader>q", "<cmd>q<CR>", opts)

-- Window movement
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Clear search
keymap("n", "<leader>c", "<cmd>nohlsearch<CR>", opts)

-- netrw
vim.keymap.set("n", "<leader>e", ":Vex<CR>", { desc = "Open netrw (Explore)" })
vim.keymap.set("n", "<leader>E", ":Ex<CR>", { desc = "Open netrw in vertical split" })
