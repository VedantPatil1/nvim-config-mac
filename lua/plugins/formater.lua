return {
  {
    -- Formatter
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("conform").setup({
        format_on_save = false,
        notify_on_error = true,
        formatters_by_ft = {
          go = { "goimports", "gofmt" },
          python = { "ruff_fix", "black" },
        },
        formatters = {
          ruff_fix = {
            command = "ruff",
            args = { "check", "--fix", "--stdin-filename", "$FILENAME", "-" },
            stdin = true,
          },
          black = {
            command = "black",
            args = { "--quiet", "-" },
            stdin = true,
          },
        },
      })

      -- Format keybinding
      vim.keymap.set("n", "<leader>f", function()
        require("conform").format({ async = true, lsp_fallback = false })
      end, { desc = "Format file" })
    end,
  }
}
