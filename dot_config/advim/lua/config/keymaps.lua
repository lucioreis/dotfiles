local set = vim.keymap.set

set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" }) 


set("n", "<space><space>x", function()
    vim.cmd("source %")
    print("Sourced " .. vim.fn.expand("%r"))
end)
set("n", "<space>x", "<cmd>:.lua<cr>")
set("n", "<cr>", "<cmd>w<cr>")
set("v", "<space>x", "<cmd>:lua<cr>")
set("n", "<C-j>", "<cmd>cnext<cr>")
set("n", "<C-n>", "<cmd>cnext<cr>")
set("n", "<C-k>", "<cmd>cprev<cr>")
set("n", "<C-p>", "<cmd>cprev<cr>")
set("n", "<space>Q", "<cmd>qall<cr>")
set("n", "<space>q", "<cmd>q<cr>")

