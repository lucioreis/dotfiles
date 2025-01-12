-- Autocmds
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = "Highlight when yanking (copying) text.",
    group = vim.api.nvim_create_augroup('kikstart-highlight-yank', { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end
})

vim.api.nvim_create_autocmd({"FileType"}, {
    pattern = {"nofile", "prompt"},
    group = vim.api.nvim_create_augroup('close-no-file-with-q', { clear = true }),
    callback = function()
        vim.keymap.set("n", "q", "<cmd>close!<cr>")
    end
})
