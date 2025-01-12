return {
  "echasnovski/mini.files",
  opts = {
    windows = {
      preview = true,
      width_focus = 30,
      width_preview = 30,
    },
    options = {
      -- Whether to use for editing directories
      -- Disabled by default in LazyVim because neo-tree is used for that
      use_as_default_explorer = false,
    },
  },
  keys = {
    {
      "<leader>e",
      function()
        if vim.fn.filereadable(vim.api.nvim_buf_get_name(0)) == 1 then
          require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
        else
          local file_path = vim.fn.expand("%:p:h")
          require("mini.files").open(file_path, true)
        end
      end,
      desc = "Open mini.files (Directory of Current File)",
    },
    {
      "0",
      function()
        if vim.fn.filereadable(vim.api.nvim_buf_get_name(0)) == 1 then
          require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
        else
          require("mini.files").open(vim.uv.cwd(), true)
        end
      end,
      desc = "Open mini.files (Directory of Current File)",
    },

    {
      "<leader>E",
      function()
        require("mini.files").open(vim.uv.cwd(), true)
      end,
      desc = "Open mini.files (cwd)",
    },
  },
}
