M = {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons", "SmiteshP/nvim-navic" },
    opts = {
      options = {
        theme = "gruvbox",
      },
      sections = {
        lualine_c = {
          { "filename" },
          {
            function()
              local navic = require("nvim-navic")
              return navic.get_location()
            end,
            cond = function()
              local navic = require("nvim-navic")
              return navic.is_available()
            end,
          },
        },
      },
    },
  },
}

return M
