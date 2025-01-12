return {
  "echasnovski/mini.jump2d",
  event = "VeryLazy",
  cmd = "MiniJump2d",
  -- keys = {
  --   {
  --     "f",
  --     function()
  --       local mj2d = require("mini.jump2d")
  --       mj2d.start(mj2d.builtin_opts.word_start)
  --     end,
  --     desc = "Jump around",
  --   },
  -- },
  opts = {
    view = { dim = false, n_steps_ahead = 20 },
  },
  config = function(_, opts)
    vim.api.nvim_set_hl(0, "MiniJump2dSpotUnique", { bold = true, italic = true, fg = "red" })

    local mj2d = require("mini.jump2d")
    mj2d.setup(opts)
  end,
}
