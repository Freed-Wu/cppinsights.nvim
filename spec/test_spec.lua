local insights = require "cppinsights".insights
local spec_path = debug.getinfo(1).source:match("@?(.*)"):gsub("/[^/]+/?$", "")

-- luacheck: ignore 113
---@diagnostic disable: undefined-global
describe("test", function()
    it("tests jieba:cut()", function()
        local f = io.open(spec_path .. "/output.cc")
        if f then
            local lines = {}
            for line in f:lines() do
                table.insert(lines, line)
            end
            assert.are.equal(insights { spec_path .. "/input.cc" }, table.concat(lines, "\n") .. "\n")
            f:close()
        end
    end)
end)
