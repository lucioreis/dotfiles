return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = {
        'nvim-lua/plenary.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
    },
    keys = {
        { "<C-f>",          require('telescope.builtin').find_files, desc = "Find files" },
        {
            "<space>fc",
            function()
                require('telescope.builtin').find_files { cwd = vim.fn.stdpath("config") }
            end,
            desc = "Find Neovim Config files",
            mode = "n"
        },
        {
            "<c-b>",
            require('telescope.builtin').buffers,
            desc = "Find active buffers",
        },
        {
            "<space>fl",
            function()
                require('telescope.builtin').find_files({
                    cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy")
                })
            end,
            desc = "Find Neovim plugins files",
        },
        {
            "<space>sh",
            require('telescope.builtin').help_tags,
            desc = "Search help tags"
        },
    },
    opts = {
        pickers = {
            buffers = {
                theme = "dropdown",
                previewer = false
            }
        },
        extensions = {
            fzf = {}
        }
    },
    config = function(...)
        require('telescope').load_extension('fzf')
        require('plugins.telescope.multigrep').setup()
        require('telescope').setup(...)
    end
}
