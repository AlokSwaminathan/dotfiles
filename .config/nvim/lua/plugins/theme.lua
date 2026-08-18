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
    enabled = false,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function(_, opts)
      require("catppuccin").setup(opts)
      vim.cmd.colorscheme("catppuccin")
    end,
    opts = {
      flavour = "mocha",
      transparent_background = true,
      highlight_overrides = {
        all = function(colors)
          return {
            Normal = { bg = colors.none },
            NormalNC = { bg = colors.none },
            NormalFloat = { bg = colors.none },
          }
        end,
      },
    },
  },
}

return M
