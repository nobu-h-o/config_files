return {
  {
    "folke/tokyonight.nvim",
    lazy    = false,    -- load on startup
    priority = 1000,    -- load before other plugins so the scheme is in effect
    opts = {
      -- customize tokyonight here:
      -- style = "storm",
      -- light_style = "day",
      -- transparent = true,
      -- terminal_colors = true,
    },
    config = function(_, opts)
      require("tokyonight").setup(opts)
      vim.cmd("colorscheme tokyonight")
    end,
  },
}

