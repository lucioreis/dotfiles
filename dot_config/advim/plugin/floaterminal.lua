---Floaterminal.lua
local state = {
    floating = {
        buf = -1,
        win = -1,
    },
    cached_data = {}
}

local function create_centered_float_window(opts)
    local width = 80  -- Set your desired width
    local height = 20 -- Set your desired height

    -- Get the current editor dimensions
    local editor_width = vim.o.columns
    local editor_height = vim.o.lines

    -- Calculate centered position
    local row = math.floor((editor_height - height) / 2)
    local column = math.floor((editor_width - width) / 2)

    -- Create a new buffer for the floating window
    local buf = nil
    if vim.api.nvim_buf_is_valid(opts.buf) then
        buf = opts.buf
    else
        buf = vim.api.nvim_create_buf(false, true) -- Create a new scratch buffer
    end

    -- Define the floating window configuration
    local win_opts = {
        relative = 'editor',
        width = width,
        height = height,
        row = row,
        col = column,
        style = 'minimal',
        border = 'rounded',
    }

    -- Open the floating window
    local win = vim.api.nvim_open_win(buf, true, win_opts)

    return { buf = buf, win = win }
end

-- Runs asynchronously:
---@param cmd string[]
---@return string[]
local function run_command(cmd)
    local cmd_key = ""
    for _, v in pairs(cmd) do
        cmd_key = cmd_key .. " " .. v
    end

    if state.cached_data[cmd_key] then
        print("from cache")
        return state.cached_data[cmd_key]
    end

    local output = vim.system({ cmd[1], cmd[2] , cmd[3], cmd[4] }, { text = true }):wait()


    local lines = {}
    if output.stderr == "" then
        for line in output.stdout:gmatch("([^\n]+)") do
            table.insert(lines, line)
        end
    end

    state.cached_data[cmd_key] = lines
    return lines
end


-- local function run_async_command(command)
--     local job_id = vim.fn.jobstart(command, {
--         on_stdout = function(_, data, _)
--             print("Output: " .. table.concat(data, "\n"))
--         end,
--         on_stderr = function(_, data, _)
--             print("Error: " .. table.concat(data, "\n"))
--         end,
--         on_exit = function(_, code)
--             print("Exited with code: " .. code)
--         end,
--     })
--
--     if job_id <= 0 then
--         print("Failed to start job")
--     end
-- end
--
-- run_async_command("http cheat.sh/golang/for -b --ignore-stdin")


vim.api.nvim_create_user_command("Chst", function(command)
    ---@type string[]
    local args = {}
    for arg in string.gmatch(command.args, "%S+") do 
        table.insert(args, arg)
    end

    if vim.fn.executable('http') ~= 1 then
        print("Err: Http is not in path")
        return
    end

    ---@type string
    local url = 'cheat.sh/' .. args[1] .. '/'
    for i=2, #args do
         url = url .. args[i]
    end
    url = url .. '?T'

    local lines = {}
    if #args == 2 then
        lines = run_command({ 'http', url, '-b', '--ignore-stdin' })
    end

    if not vim.api.nvim_win_is_valid(state.floating.win) then
        state.floating = create_centered_float_window({ buf = state.floating.buf })

        if state.floating.buf ~= -1 and state.floating.win ~= -1 then
            vim.api.nvim_set_option_value('filetype', args[1], { buf = state.floating.buf })
            vim.api.nvim_set_option_value('buftype', 'nofile', { buf = state.floating.buf })
            vim.api.nvim_buf_set_lines(state.loating.buf, 0, 1, false, {url})
            vim.api.nvim_buf_set_lines(state.floating.buf, 1, #lines, false, lines)
            vim.api.nvim_set_option_value('modifiable', true, { buf = state.floating.buf })
        end
    else
        vim.api.nvim_win_hide(state.floating.win)
        return
    end
end, {nargs='*' })

