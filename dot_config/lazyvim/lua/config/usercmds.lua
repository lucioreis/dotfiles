local function fmopen(command)
  ---@type string
  local cword = vim.fn.expand("<cWORD>")
  cword = string.match(cword, "[%./%w_-]+", 1)

  ---@type string
  local file_path = string.match(cword, "/[%w%./_-]+")
    or string.match(cword, "%./[%w%./_-]+")
    or string.match(cword, "%w[%w%./_-]*/$")
    or string.match(cword, "%w[%w%./_-]*")

  if vim.fn.isdirectory(file_path) == 1 or vim.fn.filereadable(file_path) == 1 then
    print("first if")
    local minifiles = require("mini.files")
    minifiles.open(file_path)
    return
  end
  --   anchor = "/home/lucio/.config/lazyvim/lua/config/autocmds.lua",
  local buf_name = vim.api.nvim_buf_get_name(0)
  local buf_path = vim.split(buf_name, "/")
  local file_name = vim.split(file_path, "/")

  if file_name[#file_name] == "" then
    buf_path[#buf_path] = file_name[#file_name - 1]
  else
    buf_path[#buf_path] = file_name[#file_name]
  end
  file_path = table.concat(buf_path, "/")

  if vim.fn.isdirectory(file_path) == 1 or vim.fn.filereadable(file_path) == 1 then
    local minifiles = require("mini.files")
    minifiles.open(file_path)
    return
  end

  vim.notify(file_path .. " does not exits,\nor it is not accessible from neovim!", vim.log.levels.WARN)
end

pcall(vim.api.nvim_del_user_command, "Fmopen")

vim.api.nvim_create_user_command("Fmopen", function(...)
  fmopen(...)
end, { nargs = 0 })
-- this is test ./lua of the command
vim.keymap.set("n", "<c-m>", "<cmd>:Fmopen<cr>")
