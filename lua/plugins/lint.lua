-- lua/plugins/lint.lua
return {
  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local lint = require("lint")

      -- Define linters per filetype
      lint.linters_by_ft = {
        go = { "golangci_lint" },
        python = { "ruff" },
      }

      -- Configure custom ruff linter
      lint.linters.ruff = {
        cmd = "ruff",
        args = { "check", "--quiet", "--stdin-filename", "%filepath", "-" },
        stdin = true,
        ignore_exitcode = true,
      }

      -- Optional: define how golangci_lint runs if you want to customize
      --[[ lint.linters.golangci_lint = {
        cmd = "golangci-lint",
        args = { "run", "--out-format", "json", "--path-prefix", vim.fn.getcwd() },
        stdin = false,
      } ]]

      -- Auto lint on write, with graceful error reporting
      vim.api.nvim_create_autocmd("BufWritePost", {
        callback = function()
          local ok, err = pcall(lint.try_lint)
          if not ok then
            vim.notify("[nvim-lint] Linter failed: " .. err, vim.log.levels.WARN)
          end
        end,
      })

      -- Manual lint keybinding
      vim.keymap.set("n", "<C-l>", function()
        local ok, err = pcall(lint.try_lint)
        if not ok then
          vim.notify("[nvim-lint] Linter failed: " .. err, vim.log.levels.WARN)
        end
      end, { desc = "Run linter", silent = true })
    end,
  },
}

