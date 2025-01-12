local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values

local M = {}

local colors = function(opts)
    opts = opts or {}
    pickers
        .new(opts, {
            prompt_title = "Functions",
            finder = finders.new_table({
                results = vim.tbl_keys(vim.fn),
            }),
            sorter = conf.generic_sorter(opts),
        })
        :find()
end

colors(require("telescope.themes").get_dropdown({}))
return M
