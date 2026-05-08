M = {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      -- The rewritten nvim-treesitter is a parser manager only.
      -- Highlighting is handled by Neovim's native treesitter API.
      require("nvim-treesitter.install").install(
        { "bash", "c", "diff", "go", "html", "lua", "luadoc", "latex",
          "markdown", "markdown_inline", "query", "vim", "vimdoc" },
        { skip_existing = true }
      )
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    enabled = false,
  },
  {
    "SmiteshP/nvim-navic",
    opts = {
      depth_limit = 10,
    },
  },
  {
    "SmiteshP/nvim-navbuddy",
    dependencies = {
      "SmiteshP/nvim-navic",
      "MunifTanjim/nui.nvim",
      "numToStr/Comment.nvim",
      "nvim-telescope/telescope.nvim",
    },
    -- stylua: ignore
    keys = {
      { "+", mode = "n", function() require("nvim-navbuddy").open() end, desc = "Navigate on lsp symbols" }
    },
  },
}

return M
