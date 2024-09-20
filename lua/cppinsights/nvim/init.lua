-- luacheck: ignore 112 113 212/self
---@diagnostic disable: undefined-global
local M = require "cppinsights.config"

---setup
---@param conf table
function M:setup(conf)
    M = vim.tbl_deep_extend("keep", conf, M)
end

---setup
---@param args string[]
---@param diff boolean
function M:run(args, diff)
    table.insert(args, 1, vim.api.nvim_buf_get_name(0))
    for _, arg in ipairs(M.extra_args) do
        table.insert(args, arg)
    end
    diff = diff or true
    local text = require "cppinsights".insights(args)
    local lines = {}
    for s in text:gmatch("([^\r\n]*)\r?\n") do
        table.insert(lines, s)
    end
    local cmd = ""
    if M.vertical then
        cmd = "vertical "
    end
    if diff then
        cmd = cmd .. "diff"
    end
    cmd = cmd .. "split" .. M.window_name
    vim.cmd(cmd)
    vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
    vim.o.buftype = "nofile"
end

return M
