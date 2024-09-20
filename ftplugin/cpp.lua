-- luacheck: ignore 112 113
---@diagnostic disable: undefined-global
vim.api.nvim_buf_create_user_command(0, "Insights", function(input)
    require "cppinsights.nvim":run(input.fargs, input.bang)
end, { bang = true })
