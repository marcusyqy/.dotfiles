local buffer_number = -1
local is_windows = false

local M = {}

if vim.fn.exists('g:os') == 0 then
  is_windows = vim.fn.has("win64") == 1 or vim.fn.has("win32") == 1 or vim.fn.has("win16") == 1
end

local function close_open_buffer()
    local buffer_visible = vim.api.nvim_call_function("bufwinnr", { buffer_number }) ~= -1
    if not buffer_number == 1 or buffer_visible then
        vim.cmd("bd " .. buffer_number)
    end
    buffer_number = -1
end

local function open_buffer()
 -- Get a boolean that tells us if the buffer number is visible anymore.
    --
    -- :help bufwinnr
    local buffer_visible = vim.api.nvim_call_function("bufwinnr", { buffer_number }) ~= -1

    if buffer_number == -1 or not buffer_visible then
        -- Create a new buffer with the name "AUTOTEST_OUTPUT".
        -- Same name will reuse the current buffer.
        vim.api.nvim_command("new")

        -- Collect the buffer's number.
        buffer_number = vim.api.nvim_get_current_buf()

        -- Mark the buffer as readonly.
        vim.opt_local.readonly = true
    end
end

local function log(_, data)
    -- -- Make it temporarily writable so we don't have warnings.
    -- vim.api.nvim_buf_set_option(buffer_number, "readonly", false)
    --
    -- Append the data.
    vim.api.nvim_buf_set_lines(buffer_number, -1, -1, true, data)

    -- -- Make readonly again.
    -- vim.api.nvim_buf_set_option(buffer_number, "readonly", true)

    -- Mark as not modified, otherwise you'll get an error when
    -- attempting to exit vim.
    -- vim.api.nvim_buf_set_option(buffer_number, "modified", false)

    -- -- Get the window the buffer is in and set the cursor position to the bottom.
    -- local buffer_window = vim.api.nvim_call_function("bufwinid", { buffer_number })
    -- local buffer_line_count = vim.api.nvim_buf_line_count(buffer_number)
    -- vim.api.nvim_win_set_cursor(buffer_window, { buffer_line_count, 0 })
end


M.run_in_terminal = function(str)
    vim.cmd("tab ter " .. str)
end

M.run_shell = function(str)
  if is_windows then
    M.run_in_terminal(str)
  else
    M.run_in_terminal("./" .. str .. ".sh")
  end
end

M.run = function(command, term_func)
    -- Open our buffer, if we need to.
    -- close_open_buffer()
    term_func(command)

    -- Collect the buffer's number.
    -- buffer_number = vim.api.nvim_get_current_buf()

    -- Clear the buffer's contents incase it has been used.
    -- vim.api.nvim_buf_set_lines(buffer_number, 0, -1, true, {})
    --
    -- -- local command = {}
    -- -- for str in string.gmatch(inputcommandstr, "([^%s]+)") do
    -- --     table.insert(command, str)
    -- -- end
    --
    -- -- print(command)
    --
    -- -- Make it temporarily writable so we don't have warnings.
    -- vim.api.nvim_buf_set_option(buffer_number, "readonly", false)
    --
    -- vim.fn.jobstart(command, {
    --     -- Run the command.
    --     stdout_buffered = true,
    --     on_stdout = log,
    --     on_stderr = log,
    --     on_exit = function()
    --         -- Make readonly again.
    --         vim.api.nvim_buf_set_option(buffer_number, "readonly", true)
    --         vim.api.nvim_buf_set_option(buffer_number, "modified", false)
    --
    --         local buffer_window = vim.api.nvim_call_function("bufwinid", { buffer_number })
    --         local buffer_line_count = vim.api.nvim_buf_line_count(buffer_number)
    --         vim.api.nvim_win_set_cursor(buffer_window, { buffer_line_count, 0 })
    --
    --         vim.cmd("bd ".. buffer_number)
    --         -- vim.api.nvim_buf_delete(buffer_number)
    --         buffer_number = -1
    --     end
    -- })
end

return M
