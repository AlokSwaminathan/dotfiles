M = {
  {
    "kdheepak/lazygit.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    -- stylua: ignore
    keys = {
      {"<leader>lg", "<cmd>LazyGit<cr>", desc = "Open lazygit in current working directory" }
    },
  },
}

return M
