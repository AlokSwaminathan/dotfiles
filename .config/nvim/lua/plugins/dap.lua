M = {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "leoluz/nvim-dap-go",
      "igorlfs/nvim-dap-view",
    },
    config = function()
      require("dap-go").setup({
        dap_configurations = {
          {
            type = "go",
            name = "Debug test",
            request = "launch",
            mode = "test",
            program = "${fileDirname}",
          },
        },
      })

      require("dap-view").setup({
        auto_toggle = true,
        winbar = {
          sections = { "console", "watches", "scopes", "exceptions", "breakpoints", "threads", "repl" },
          controls = { enabled = true },
        },
      })

      local dap = require("dap")

      -- Navigation
      vim.keymap.set("n", "<F5>", dap.continue, { desc = "DAP Continue" })
      vim.keymap.set("n", "<F10>", dap.step_over, { desc = "DAP Step Over" })
      vim.keymap.set("n", "<F11>", dap.step_into, { desc = "DAP Step Into" })
      vim.keymap.set("n", "<F12>", dap.step_out, { desc = "DAP Step Out" })

      -- Breakpoints
      vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint, { desc = "DAP Toggle Breakpoint" })
      vim.keymap.set("n", "<leader>bc", function()
        dap.set_breakpoint(vim.fn.input("Condition: "))
      end, { desc = "DAP Conditional Breakpoint" })

      -- Launch
      vim.keymap.set("n", "<leader>dr", function()
        require("dap-go").debug_test()
      end, { desc = "DAP Debug Nearest Test" })

      -- End session
      vim.keymap.set("n", "<leader>dq", dap.terminate, { desc = "DAP Terminate" })
      vim.keymap.set("n", "<leader>dx", dap.disconnect, { desc = "DAP Disconnect (keep process running)" })

      -- UI
      vim.keymap.set("n", "<leader>dv", "<cmd>DapViewToggle!<CR>", { desc = "DAP Toggle View" })
    end,
  },
}

return M
