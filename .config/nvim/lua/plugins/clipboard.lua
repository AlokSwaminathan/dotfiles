M = {
  {
    "AckslD/nvim-neoclip.lua",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      {
        "kkharji/sqlite.lua",
        module = "sqlite",
      },
    },
    opts = {
      preview = true,
      enable_persistent_history = true,
      continuous_sync = true,
    },
  },
}

return M
