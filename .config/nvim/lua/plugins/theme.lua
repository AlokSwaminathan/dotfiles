M = {
  {
    "folke/tokyonight.nvim",
    priority = 1000,
    init = function()
      -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
      vim.cmd.colorscheme("tokyonight-night")
    end,
    enabled = false,
  },
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = true,
    opts = {
      transparent_mode = true,
    },
    init = function()
      vim.cmd.colorscheme("gruvbox")
    end,
  },
}

return M
