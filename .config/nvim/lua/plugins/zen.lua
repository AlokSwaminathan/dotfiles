M = {
  {
    "folke/zen-mode.nvim",
    opts = {},
    -- stylua: ignore
    keys = {
      { "<leader>z", mode = { "n", "v" }, function() require("zen-mode").toggle() end, desc = "Start Zen Mode" },
    },
  },
}

return M
