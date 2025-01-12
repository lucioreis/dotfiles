return {
  "stevearc/oil.nvim",
  lazy = false,
  keys = {
    { "-", "<cmd>Oil<cr>", desc = "Open Oil" },
  },
  opts = {
    default_file_explorer = true,
    delete_to_trash = true,
    skip_confirm_for_simple_edits = true,
    keymaps = {
      ["q"] = { "actions.close", mode = "n" },
      ["L"] = { "actions.select", mode = "n" },
      ["H"] = { "actions.parent", mode = "n" },
    },
  }
}
