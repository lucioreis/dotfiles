return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  -- or                              , branch = '0.1.x',
  dependencies = { "nvim-lua/plenary.nvim" },

  opts = {
    extensions = {
      plugin_name = {},
    },
  },
  config = function(_, opts)
    require("telescope").load_extension("plugin_name")
  end,
}
